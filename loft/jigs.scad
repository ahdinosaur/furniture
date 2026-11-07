// The three drilling jigs from loft/README.md, step 4. 3D printed.
//
// A jig is a printed saddle that drops over a post or a rail. On top are two
// pockets, 40 mm apart. A Big Gator steel drill guide (the "bar") sits in a
// pocket, flat on the wood, and guides the bit. Drill a hole, lift the bar
// into the other pocket, drill the other. The plastic only places the bar.
// The steel guides the bit, so the plastic never wears.
//
// The bars taper: wide at the top, narrow at the bottom. The pockets taper
// to match, loose at the bottom and snug at the top of the wall, so the bar
// always centres on the top edge of the wall.
//
// Bit sizes: snug under the bolt head, loose under the nut. Heads go on the
// posts for rail bolts (6.5), nuts on the rails (8). Support bolts: nuts on
// the posts (10), heads on the supports (8.5, drilled through the post hole,
// no jig). Only the master long rail is jig-drilled; every other rail is
// copied from a template, see the "copy" view and README step 6.
//
// Axes: x along the part, y across it (0 to 90), z up. z = 0 is the top face
// of the wood. With print = true a single jig is flipped flat side down,
// ready to slice.

view = "all"; // "all" | "post_m6" | "post_m8" | "rail" | "on_post" | "on_rail" | "rail_end" | "copy"
print = false; // true flips a single jig view for printing

$fn = 48;
eps = 0.01;

// ---- MEASURE THESE WITH A RULER BEFORE PRINTING ----------------------------
// The bars, as [length, top width, bottom width, height]. Read the widths
// across an end face: the top is the widest, the bottom the narrowest.
bar_small = [140, 22.2, 14.3, 22.2]; // MDG1000NP, 3 to 9.5 mm
bar_large = [134, 25.4, 17.5, 22.2]; // MDG2000NP, 10 to 14 mm. Bottom width is a guess.
// From the end of the bar with the SMALLEST hole to the centre of the hole we
// use. These are guesses from the hole count. Replace them with your readings.
hole_6_5_from_end = 78;  // MDG1000NP, the 6.5 hole
hole_8_from_end = 110;   // MDG1000NP, the 8 hole
hole_10_from_end = 8;    // MDG2000NP, the 10 hole
// ----------------------------------------------------------------------------

part_w = 90;       // posts and rails are 90 wide
part_clear = 1;    // total gap between the cheeks and the wood. Tight? Raise it.
cheek = 6;         // cheek thickness
hang_post = 40;    // cheeks hang this far down a post
hang_rail = 30;    // cheeks hang this far down a rail lying flat (45 thick)
stop_hang = 50;    // RAIL end stop hangs this far, past the 45 mm rail end
frame_h = 15;      // frame height. The bar stands 7 mm proud so you can grab it
wall = 8;          // frame wall around a pocket
pocket_clear = [2, 0.5, 1.5]; // longer than the bar, wider at the wall top, wider at the bottom
engrave = 0.8;     // depth of the labels and arrows
pair = [25, 65];   // the two holes, across a post or along a rail from its end

ink = "black";
plastic = "orange";
steel = "gainsboro";
post_colour = "steelblue";
rail_colour = "lightpink";
master_colour = "palegreen";

cheek_in = part_clear / 2;             // cheek inner face, past the wood
cheek_out = cheek_in + cheek;          // cheek outer face

// Bar width at height h above the wood.
function bar_w(b, h) = b[2] + (b[1] - b[2]) * h / b[3];

// A bar with its one working hole, lying along +x from the origin, small end
// at x = 0, centred on y = 0.
module bar(b, offset, bit) {
  color(steel)
  difference() {
    translate([b[0] / 2, 0, 0])
    linear_extrude(b[3], scale = [1, b[1] / b[2]])
    square([b[0], b[2]], center = true);
    translate([offset, 0, -eps]) cylinder(d = bit, h = b[3] + 2 * eps);
  }
}

// The pocket a bar drops into: along +x from x = 0 (the push wall), centred on
// y = 0. Tapered like the bar, cut right through the frame.
module pocket(b) {
  len = b[0] + pocket_clear[0];
  bottom = b[2] + pocket_clear[2];
  top = bar_w(b, frame_h) + pocket_clear[1];
  h = frame_h + 2 * eps;
  translate([len / 2, 0, -eps])
  linear_extrude(h, scale = [1, top / bottom])
  square([len, bottom], center = true);
}

// Width of the pocket at the frame top, for sizing the frame around it.
function pocket_top_w(b) = bar_w(b, frame_h) + pocket_clear[1];

// Engraved arrow in the frame top, pointing toward -x, tip at x.
module arrow(x, y) {
  translate([0, 0, frame_h - engrave])
  linear_extrude(engrave + eps)
  polygon([[x, y], [x + 5, y + 3.5], [x + 5, y - 3.5]]);
}

// Engraved label in the frame top, centred at [x, y], along x (rot = 0) or y.
module label(txt, x, y, rot = 0) {
  translate([x, y, frame_h - engrave])
  linear_extrude(engrave + eps)
  rotate(rot)
  text(txt, size = 6, halign = "center", valign = "center");
}

// The index line at x = 0: a rib down the outside of each cheek and a notch
// in its bottom edge, so the pencil line shows through.
module index_rib(hang) {
  color(ink)
  for (y = [-cheek_out - 1, part_w + cheek_out])
    translate([-0.6, y, -hang]) cube([1.2, 1, hang + frame_h]);
}
module index_notch(hang) {
  for (y = [-cheek_out + cheek / 2, part_w + cheek_out - cheek / 2])
    translate([0, y, -hang]) rotate([90, 0, 0]) rotate([0, 0, 45])
    cube([3, 3, cheek + 2], center = true);
}

// POST jig: bar lies along the post. Two pockets at y = 25 and 65. The hole
// lands at x = 0, on the index line.
module post_jig(name, bit, b, offset) {
  len = b[0] + pocket_clear[0];
  xa = -offset;              // push wall. Bar end sits here, hole at x = 0.
  x0 = xa - wall;
  x1 = xa + len + wall;
  color(plastic)
  difference() {
    union() {
      translate([x0, -cheek_out, 0]) cube([x1 - x0, part_w + 2 * cheek_out, frame_h]);
      for (y = [-cheek_out, part_w + cheek_in])
        translate([x0, y, -hang_post]) cube([x1 - x0, cheek, hang_post]);
    }
    for (y = pair) translate([xa, y, 0]) pocket(b);
    arrow(xa - wall + 1.5, part_w / 2);
    label(str(name, "  ", bit), (x0 + x1) / 2, part_w / 2);
    index_notch(hang_post);
  }
  index_rib(hang_post);
}

// RAIL jig: bar lies across the rail. Two pockets at x = 25 and 65 from the
// end stop. The hole lands at y = 45, the centre of the rail.
module rail_jig(b, offset) {
  len = b[0] + pocket_clear[0];
  wid = pocket_top_w(b);
  ya = part_w / 2 - offset;  // push wall. Bar end sits here, hole at y = 45.
  y0 = ya - wall;
  y1 = part_w + cheek_out;
  x0 = -cheek;               // end stop
  x1 = pair[1] + wid / 2 + wall;
  color(plastic)
  difference() {
    union() {
      translate([x0, y0, 0]) cube([x1 - x0, y1 - y0, frame_h]);
      for (y = [-cheek_out, part_w + cheek_in])
        translate([0, y, -hang_rail]) cube([x1, cheek, hang_rail]);
      // end stop across the rail end
      translate([x0, -cheek_out, -stop_hang]) cube([cheek, part_w + 2 * cheek_out, stop_hang]);
      // floor under the part of the pockets that hangs past the rail
      translate([x0, y0, -3]) cube([x1 - x0, -cheek_out - y0, 3]);
    }
    for (x = pair) translate([x, ya, 0]) rotate(90) pocket(b);
    translate([0, 0, 0]) rotate(90) arrow(ya - wall + 1.5, -part_w / 2);
    label("RAIL  8", part_w / 2, (ya + y1) / 2, 90);
  }
}

module post_m6() { post_jig("POST M6", 6.5, bar_small, hole_6_5_from_end); }
module post_m8() { post_jig("POST M8", 10, bar_large, hole_10_from_end); }
module rail_jig_m8() { rail_jig(bar_small, hole_8_from_end); }

// Bars sitting in pocket 1 of each jig, for the pictures.
module post_m6_bar() { translate([-hole_6_5_from_end, pair[0], 0]) bar(bar_small, hole_6_5_from_end, 6.5); }
module post_m8_bar() { translate([-hole_10_from_end, pair[0], 0]) bar(bar_large, hole_10_from_end, 10); }
module rail_bar() {
  translate([pair[0], part_w / 2 - hole_8_from_end, 0]) rotate(90)
  bar(bar_small, hole_8_from_end, 8);
}

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
    for (from_end = pair, end = both_ends ? [0, 1] : [1]) {
      x = end == 1 ? length - from_end : from_end;
      translate([x, 45, -eps]) cylinder(d = 8, h = 45 + 2 * eps);
      translate([x, 45, 45 - 20]) cylinder(d = 25, h = 20 + eps);
    }
  }
}

// Flip a jig flat side down for printing.
module printable() {
  if (print) translate([0, 0, frame_h]) rotate([180, 0, 0]) children();
  else children();
}

if (view == "all") {
  // three jigs in a row, a bar in the first pocket of each
  post_m6(); post_m6_bar();
  translate([0, 140, 0]) { post_m8(); post_m8_bar(); }
  translate([0, 360, 0]) { rail_jig_m8(); rail_bar(); }
} else if (view == "post_m6") {
  printable() post_m6();
} else if (view == "post_m8") {
  printable() post_m8();
} else if (view == "rail") {
  printable() rail_jig_m8();
} else if (view == "on_post") {
  // POST M6 jig on a post, index line on the pencil line, bar in pocket 1
  post_piece(400, 200);
  translate([200, 0, 90]) { post_m6(); post_m6_bar(); }
  color("silver") translate([200, pair[0], 0]) cylinder(d = 6.5, h = 90 + bar_small[2] + 60);
} else if (view == "on_rail") {
  // RAIL jig on the end of a rail, end stop against the end, bar in pocket 1
  rail_piece(400);
  translate([0, 0, 45]) { rail_jig_m8(); rail_bar(); }
  color("silver") translate([pair[0], part_w / 2, 0]) cylinder(d = 8, h = 45 + bar_small[2] + 60);
} else if (view == "rail_end") {
  // the end of a finished rail, recess side up
  rail_end(200);
  // a bolt in the far hole: dome underneath, washer and nut in the recess
  x = 200 - pair[1];
  color("silver") translate([x, 45, -3]) cylinder(d = 6, h = 3 + 45 - 20 + 15);
  color("silver") translate([x, 45, -3]) cylinder(d = 13, h = 3);
  color("silver") translate([x, 45, 45 - 20]) cylinder(d = 18, h = 1.6);
  color("silver") translate([x, 45, 45 - 20 + 1.6]) cylinder(d = 11, h = 6, $fn = 6);
} else if (view == "copy") {
  // the master rail (green, drilled both ends, recesses up) clamped on a
  // shorter blank. Lengths differ, so the master overhangs a little each end.
  blank = 380;
  master = 400;
  rail_piece(blank);
  translate([-(master - blank) / 2, 0, 45]) rail_end(master, both_ends = true, colour = master_colour);
  // the 8 mm bit in the near hole, tip dimpling the blank
  x = -(master - blank) / 2 + pair[0];
  color("silver") translate([x, 45, 45 - 2]) cylinder(d = 8, h = 2 + 45 + 60);
} else {
  assert(false, str("unknown view: ", view));
}
