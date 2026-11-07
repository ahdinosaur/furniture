// The four drilling jigs from loft/README.md, step 4.
//
// A jig is a 150 mm offcut of 90 x 45 with a 12 mm ply cheek screwed to each
// side, so it drops over a post or a rail like a saddle. The holes go through
// the 45 mm thickness and guide the drill bit straight.
//
// Axes: x along the block, y across it, z up. The block sits on top of the part.

view = "all"; // "all" | "post_m6" | "post_m8" | "rail" | "support" | "on_post" | "on_rail"

$fn = 48;
eps = 0.01;

block = [150, 90, 45]; // length, width, thickness of the 90 x 45 offcut
ply = 12;              // cheek and end stop thickness
cheek_hang = 50;       // how far the cheeks hang below the block
stop_hang = 90;        // how far the end stop hangs below the block (full rail depth)

// Hole pairs. POST jigs: across the block at one place along it.
// RAIL and SUPPORT jigs: along the block from the end stop, on the centre line.
post_holes = [[75, 25], [75, 65]];
rail_holes = [[block[0] - 25, 45], [block[0] - 65, 45]]; // end stop is at x = 150
label_x = 30; // labels sit at this end, clear of the holes

wood = "burlywood";
ply_colour = "wheat";
ink = "black";
post_colour = "steelblue";
rail_colour = "lightpink";

module jig(name, bit, holes, end_stop = false) {
  // block with the two holes
  color(wood)
  difference() {
    cube(block);
    for (h = holes)
      translate([h[0], h[1], -eps])
      cylinder(d = bit, h = block[2] + 2 * eps);
  }

  // cheeks, flush with the block top, hanging below
  color(ply_colour)
  for (y = [-ply, block[1]])
    translate([0, y, -cheek_hang])
    cube([block[0], ply, block[2] + cheek_hang]);

  if (end_stop) {
    // end stop across one end, hanging 90 below the block
    color(ply_colour)
    translate([block[0], -ply, -stop_hang])
    cube([ply, block[1] + 2 * ply, block[2] + stop_hang]);
  } else {
    // pencil line across both cheeks through the hole centres
    color(ink)
    for (y = [-ply - eps, block[1] + ply - 1 + eps])
      translate([holes[0][0] - 0.5, y, -cheek_hang])
      cube([1, 1, block[2] + cheek_hang]);
  }

  // label on top
  color(ink)
  translate([label_x, block[1] / 2 + 8, block[2]])
  linear_extrude(0.5)
  text(name, size = 7, halign = "center", valign = "center");
  color(ink)
  translate([label_x, block[1] / 2 - 8, block[2]])
  linear_extrude(0.5)
  text(str(bit, " mm"), size = 6, halign = "center", valign = "center");
}

module post_m6() { jig("POST M6", 8, post_holes); }
module post_m8() { jig("POST M8", 9.5, post_holes); }
module rail_jig() { jig("RAIL", 6.5, rail_holes, end_stop = true); }
module support_jig() { jig("SUPPORT", 8.5, rail_holes, end_stop = true); }

// A length of 90 x 90 post lying along x, with a pencil line around it.
module post_piece(length = 400, line_at = 200) {
  color(post_colour)
  cube([length, 90, 90]);
  color(ink)
  translate([line_at - 0.5, -eps, -eps])
  difference() {
    cube([1, 90 + 2 * eps, 90 + 2 * eps]);
    translate([-eps, 1, 1]) cube([2, 88, 88]);
  }
}

// A length of 90 x 45 rail lying flat along x, 90 face up.
module rail_piece(length = 400) {
  color(rail_colour)
  cube([length, 90, 45]);
}

if (view == "all") {
  // four jigs in a row, end stops toward the viewer
  translate([0, 0, 0]) post_m6();
  translate([0, 160, 0]) post_m8();
  translate([0, 320, 0]) rail_jig();
  translate([0, 480, 0]) support_jig();
} else if (view == "post_m6") {
  post_m6();
} else if (view == "post_m8") {
  post_m8();
} else if (view == "rail") {
  rail_jig();
} else if (view == "support") {
  support_jig();
} else if (view == "on_post") {
  // POST M6 jig sitting on a post, cheek line on the pencil line
  post_piece(400, 200);
  translate([200 - post_holes[0][0], 0, 90]) post_m6();
  // the drill bit, in the hole
  color("silver")
  translate([200, post_holes[0][1], 0])
  cylinder(d = 8, h = 90 + block[2] + 60);
} else if (view == "on_rail") {
  // RAIL jig pushed onto the end of a rail, end stop against the end
  translate([block[0] - 400, 0, 0]) rail_piece(400);
  translate([0, 0, 45]) rail_jig();
  // the drill bit, in the hole nearest the end
  color("silver")
  translate([rail_holes[0][0], rail_holes[0][1], 0])
  cylinder(d = 6.5, h = 45 + block[2] + 60);
}
