// Loft bunk-bed loft frame. See ./README.md for BOM, tools, and assembly.
// Render the whole thing (default) or any sub-assembly by overriding `view`
// on the CLI, e.g. `openscad -D 'view="post"' loft.scad`. See the dispatch
// block at the bottom of this file for the supported view names.

view = "all"; // "all" | "side_a" | "side_b" | "bed_frame" | "safety_rails" | "post" | "post_blank" | "bed_panel"


eps = 0.01;

b45x45 = [45, 45];
b45x90 = [45, 90];
b45x140 = [45, 140];
b45x190 = [45, 190];
b45x240 = [45, 240];
b45x290 = [45, 290];
b25x100 = [25, 100];
b25x150 = [25, 150];
b25x200 = [25, 200];
b25x300 = [25, 300];

ladder_rungs = 8;
ladder_gap = 240;
ladder_spacing = ladder_gap + b45x90[0];
ladder_height = b45x90[1] + (ladder_rungs - 1) * ladder_spacing;
ladder_start = 90; // bottom rung shelf, as built. Rung 1 top is 1845.
ladder_notch = 30;
// SAFETY: ladder gap is 240mm
echo(ladder_gap = ladder_gap);
echo(ladder_height = ladder_height);

post_height = 2435;
bed_height = 1715; // joist bottom
bed_length = 2030 + 20; // 10mm clearance on each side
bed_width = 1070 + 20; // 10mm clearance on each side
side_width = bed_width - 2 * b45x90[1];
panel_thickness = 12;
slat_count = 6;
slat_width = 200;
safety_rungs = 4;
support_bottom = 200;
// The lowest long rail (tier 3) sits 20 mm above the 1805 it would have at even
// spacing. Its centred bolt lands at 1870, clear of rung 1 (top 1845) and the
// rung screws in that band. See README step 5.
rail_tier3_lift = 20;
safety_gap = 90; // between rail tiers, except 70 above tier 3
support_height = 600;

// Support panel bolts: pairs at these heights, head on the ply outside, nut
// recessed in the post's inner face. Not drawn. README step 5 has the table.
panel_bolt_back = [250, 550]; // back posts, through the long faces
panel_bolt_side = [400, 700]; // side "a" posts, through the end faces

// Bed panel. It runs 90 further at the side "a" end, with a notch around each
// side "a" post, to close the slot between those posts. Breathing holes sit
// in the two bays between the joists, laid out from the panel's centre lines
// so a panel cut a few mm under size still misses the joists. See README step 10.
panel_extension = b45x90[1];
notch_clearance = 2; // the notch is cut 2 wider than the post, README step 10
breathing_hole = 25;
breathing_cols = [for (o = [-315, -215, -115, 115, 215, 315]) bed_width / 2 + o];
breathing_rows = [for (k = [-6 : 6]) bed_length / 2 + k * 150];
echo(bed_panel = [bed_length + panel_extension, bed_width],
     notch = [panel_extension, b45x90[1] + notch_clearance],
     breathing_holes = len(breathing_cols) * len(breathing_rows));

// SAFETY: end gap is 60mm
echo(end_gap = ladder_gap - 2 * b45x90[1]);

// beams

module beam_zx(beam_size, length) {
  cube([beam_size[1], beam_size[0], length]);
}

module beam_zy(beam_size, length) {
  cube([beam_size[0], beam_size[1], length]);
}

module beam_yz(beam_size, length) {
  cube([beam_size[0], length, beam_size[1]]);
}

module beam_yx(beam_size, length) {
  cube([beam_size[1], length, beam_size[0]]);
}

module beam_xz(beam_size, length) {
  cube([length, beam_size[0], beam_size[1]]);
}

module beam_xy(beam_size, length) {
  cube([length, beam_size[1], beam_size[0]]);
}

module panel_xy(length, width) {
  cube([length, width, panel_thickness]);
}

module panel_xz(length, width) {
  cube([length, panel_thickness, width]);
}

module panel_yz(length, width) {
  cube([panel_thickness, length, width]);
}

// post

module post_front() {
  color("green")
  beam_zy(b45x90, post_height);
}

module post_back() {
  color("blue")
  translate([
    b45x90[0],
    0
  ])
  beam_zy(b45x90, post_height);
}

module post(has_ladder) {
  difference() {
    union() {
      post_front();
      post_back();
    }

    if (has_ladder) {
      translate([
        -eps,
        b45x90[1] - ladder_notch + eps,
        0,
      ])
      ladder_rungs_iter() {
        beam_yx(b45x90 + [2 * eps, 2 * eps], ladder_notch + eps);
      }
    }
  }
}

module side(side_id) {
  has_ladder = side_id == "b";

  post(has_ladder);

  translate([0, bed_width])
  mirror([0, 1, 0])
  post(has_ladder);

  if (has_ladder) {
    ladder_rungs_iter(print = true) {
      translate([0, b45x90[1] - ladder_notch, 0])
      color("red")
      beam_yx(b45x90, bed_width - 2 * (b45x90[1] - ladder_notch));
    }
  }
}

module ladder_rungs_iter(print = false) {
  spacing = (ladder_height - 2 * b45x90[0]) / (ladder_rungs - 1);
  if (print) {
    // SAFETY: ladder gap is 240mm
    echo(ladder_gap = spacing - b45x90[0]);
  }

  for (ladder_index = [0: ladder_rungs - 1]) {
    top = ladder_start + ladder_height - (ladder_index * spacing);

    if (print) {
      echo(ladder_index = ladder_index, ladder_top = top);
    }

    translate([
      0,
      0,
      top - b45x90[1]
    ])
    children();
  }
}

module bed_frame(with_panel = true) {
  color("yellow")
  translate([0, b45x90[1]])
  beam_xz(b45x90, bed_length);

  color("yellow")
  translate([0, b45x90[1] + (1/2) * (side_width - b45x90[0])])
  beam_xz(b45x90, bed_length);

  color("yellow")
  translate([0, side_width + b45x90[0]])
  beam_xz(b45x90, bed_length);

  if (with_panel) {
    translate([0, 0, b45x90[1]])
    bed_panel();
  }

  // support sides
  color("cyan")
  translate([0, 0, -b45x90[1]])
  beam_yz(b45x90, bed_width);

  color("cyan")
  translate([bed_length - b45x90[0], 0, -b45x90[1]])
  beam_yz(b45x90, bed_width);
}

// Side "b" end at x = bed_length, notched end at x = -panel_extension.
module bed_panel() {
  color("orange")
  difference() {
    translate([-panel_extension, 0, 0])
    panel_xy(bed_length + panel_extension, bed_width);

    // notches around the two side "a" posts
    for (y = [-eps, bed_width - b45x90[1] - notch_clearance])
      translate([-panel_extension - eps, y, -eps])
      cube([panel_extension + eps, b45x90[1] + notch_clearance + eps, panel_thickness + 2 * eps]);

    // breathing holes
    for (x = breathing_rows, y = breathing_cols)
      translate([x, y, -eps])
      cylinder(d = breathing_hole, h = panel_thickness + 2 * eps, $fn = 32);
  }
}

module front_support_panel() {
  color("teal")
  translate([
    -2 * b45x90[0] - panel_thickness,
    0,
    support_bottom,
  ])
  panel_yz(bed_width, support_height);
}

module side_support_panel() {
  color("purple")
  translate([
    -2 * b45x90[0],
    bed_width,
    support_bottom,
  ])
  panel_xz(bed_length + 4 * b45x90[0], support_height);
}

module safety_rail(is_top, lift = 0) {
  // front
  color("pink")
  translate([
    -2 * b45x90[0],
    -1 * b45x90[0],
    -b45x90[1] + lift,
  ])
  beam_xz(b45x90, bed_length + 4 * b45x90[0]);

  // back
  color("pink")
  translate([
    -2 * b45x90[0],
    bed_width,
    -b45x90[1] + lift,
  ])
  beam_xz(b45x90, bed_length + 4 * b45x90[0]);

  // side
  if (!is_top) {
    color("pink")
    translate([
      -3 * b45x90[0],
      0,
      0
    ])
    beam_yz(b45x90, bed_width);
  }
}

module safety_rails() {
  spacing = b45x90[1] + safety_gap;
  // SAFETY: safety gap is 90mm, 70mm above tier 3 (rail_tier3_lift)
  echo(safety_gap = safety_gap, bottom_gap = safety_gap - rail_tier3_lift);

  for (safety_index = [0: safety_rungs - 1]) {
    is_top = safety_index == 0;
    is_bottom = safety_index == safety_rungs - 1;
    top = post_height - (safety_index * spacing);
    lift = is_bottom ? rail_tier3_lift : 0;
    echo(safety_index = safety_index, long_rail_bottom = top - b45x90[1] + lift, long_rail_top = top + lift);

    translate([0, 0, top])
    safety_rail(is_top, lift);
  }
}

module loft() {
  translate([
    -2 * b45x90[0],
    0,
  ])
  side("a");

  translate([
    bed_length,
    0,
  ])
  side("b");

  translate([
    0,
    0,
    bed_height
  ])
  bed_frame();

  side_support_panel();

  front_support_panel();

  safety_rails();
}

if      (view == "all")          loft();
else if (view == "side_a")       side("a");
else if (view == "side_b")       side("b");
else if (view == "bed_frame")    bed_frame(with_panel = false);
else if (view == "safety_rails") safety_rails();
else if (view == "post")         rotate([0, 90, 0]) post(true);
else if (view == "post_blank")   rotate([0, 90, 0]) post(false);
else if (view == "bed_panel")    bed_panel();
else assert(false, str("unknown view: ", view, " (see header for valid names)"));
