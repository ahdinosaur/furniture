// The three drilling jigs from loft/README.md, step 4.
//
// A jig is a 150 mm offcut of 90 x 45 with a 12 mm ply cheek screwed to each
// side, so it drops over a post or a rail like a saddle. The holes go through
// the 45 mm thickness and guide the drill bit straight.
//
// Bit sizes: snug under the bolt head, loose under the nut. Heads go on the
// posts for rail bolts (6.5), nuts on the rails (8). Support bolts: nuts on
// the posts (10), heads on the supports (8.5, drilled through the post hole,
// no jig). Only the master long rail is jig-drilled; every other rail is
// copied from a template, see the "copy" view and README step 6.
//
// Axes: x along the block, y across it, z up. The block sits on top of the part.

view = "all"; // "all" | "post_m6" | "post_m8" | "rail" | "on_post" | "on_rail" | "rail_end" | "copy"

$fn = 48;
eps = 0.01;

block = [150, 90, 45]; // length, width, thickness of the 90 x 45 offcut
ply = 12;              // cheek and end stop thickness
cheek_hang = 50;       // how far the cheeks hang below the block
stop_hang = 90;        // how far the end stop hangs below the block (full rail depth)

// Hole pairs. POST jigs: across the block at one place along it.
// RAIL jig: along the block from the end stop, on the centre line.
post_holes = [[75, 25], [75, 65]];
rail_holes = [[block[0] - 25, 45], [block[0] - 65, 45]]; // end stop is at x = 150
label_x = 30; // labels sit at this end, clear of the holes

wood = "burlywood";
ply_colour = "wheat";
ink = "black";
post_colour = "steelblue";
rail_colour = "lightpink";
master_colour = "palegreen";

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

module post_m6() { jig("POST M6", 6.5, post_holes); }
module post_m8() { jig("POST M8", 10, post_holes); }
module rail_jig() { jig("RAIL", 8, rail_holes, end_stop = true); }

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

// A finished rail end: two 8 mm holes with 25 mm nut recesses, 20 deep, in
// the face that goes on the outside of the loft. both_ends drills the far end
// too, for the master rail in the "copy" view.
module rail_end(length = 300, both_ends = false, colour = rail_colour) {
  color(colour)
  difference() {
    cube([length, 90, 45]);
    for (h = rail_holes, end = both_ends ? [0, 1] : [1]) {
      from_end = block[0] - h[0]; // 25 and 65
      x = end == 1 ? length - from_end : from_end;
      translate([x, h[1], -eps]) cylinder(d = 8, h = 45 + 2 * eps);
      translate([x, h[1], 45 - 20]) cylinder(d = 25, h = 20 + eps);
    }
  }
}

if (view == "all") {
  // three jigs in a row, end stop toward the viewer
  translate([0, 0, 0]) post_m6();
  translate([0, 160, 0]) post_m8();
  translate([0, 320, 0]) rail_jig();
} else if (view == "post_m6") {
  post_m6();
} else if (view == "post_m8") {
  post_m8();
} else if (view == "rail") {
  rail_jig();
} else if (view == "on_post") {
  // POST M6 jig sitting on a post, cheek line on the pencil line
  post_piece(400, 200);
  translate([200 - post_holes[0][0], 0, 90]) post_m6();
  // the drill bit, in the hole
  color("silver")
  translate([200, post_holes[0][1], 0])
  cylinder(d = 6.5, h = 90 + block[2] + 60);
} else if (view == "on_rail") {
  // RAIL jig pushed onto the end of a rail, end stop against the end
  translate([block[0] - 400, 0, 0]) rail_piece(400);
  translate([0, 0, 45]) rail_jig();
  // the drill bit, in the hole nearest the end
  color("silver")
  translate([rail_holes[0][0], rail_holes[0][1], 0])
  cylinder(d = 8, h = 45 + block[2] + 60);
} else if (view == "rail_end") {
  // the end of a finished rail, recess side up
  rail_end(200);
  // a bolt in the far hole: dome underneath, washer and nut in the recess
  x = 200 - (block[0] - rail_holes[1][0]);
  color("silver") translate([x, rail_holes[1][1], -3]) cylinder(d = 6, h = 3 + 45 - 20 + 15);
  color("silver") translate([x, rail_holes[1][1], -3]) cylinder(d = 13, h = 3);
  color("silver") translate([x, rail_holes[1][1], 45 - 20]) cylinder(d = 18, h = 1.6);
  color("silver") translate([x, rail_holes[1][1], 45 - 20 + 1.6]) cylinder(d = 11, h = 6, $fn = 6);
} else if (view == "copy") {
  // the master rail (green, drilled both ends, recesses up) clamped on a
  // shorter blank. Lengths differ, so the master overhangs a little each end.
  blank = 380;
  master = 400;
  rail_piece(blank);
  translate([-(master - blank) / 2, 0, 45]) rail_end(master, both_ends = true, colour = master_colour);
  // the 8 mm bit in the near hole, tip dimpling the blank
  x = -(master - blank) / 2 + (block[0] - rail_holes[0][0]);
  color("silver") translate([x, rail_holes[0][1], 45 - 2]) cylinder(d = 8, h = 2 + 45 + 60);
}
