// Loft bunk-bed loft frame. See ./README.md for BOM, tools, and assembly.
// Render the whole thing (default) or any sub-assembly by overriding `view`
// on the CLI, e.g. `openscad -D 'view="post"' loft.scad`. See the dispatch
// block at the bottom of this file for the supported view names.

view = "all"; // "all" | "side_a" | "side_b" | "bed_frame" | "safety_rails" | "post"


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
ladder_start = 90;
ladder_notch = 30;
// SAFETY: ladder gap is 240mm
echo(ladder_gap = ladder_gap);
echo(ladder_height = ladder_height);

post_height = 2435;
bed_height = 1715;
bed_length = 2030 + 20; // 10mm clearance on each side
bed_width = 1070 + 20; // 10mm clearance on each side
side_width = bed_width - 2 * b45x90[1];
panel_thickness = 12;
slat_count = 6;
slat_width = 200;
safety_rungs = 4;
support_bottom = 200;
support_height = 600;

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
    color("orange")
    translate([0, 0, b45x90[1]])
    panel_xy(bed_length, bed_width);
  }

  // support sides
  color("cyan")
  translate([0, 0, -b45x90[1]])
  beam_yz(b45x90, bed_width);

  color("cyan")
  translate([bed_length - b45x90[0], 0, -b45x90[1]])
  beam_yz(b45x90, bed_width);
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

module safety_rail(is_top) {
  // front
  color("pink")
  translate([
    -2 * b45x90[0],
    -1 * b45x90[0],
    -b45x90[1],
  ])
  beam_xz(b45x90, bed_length + 4 * b45x90[0]);

  // back
  color("pink")
  translate([
    -2 * b45x90[0],
    bed_width,
    -b45x90[1],
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
  spacing = (post_height - bed_height - 2 * b45x90[1]) / (safety_rungs - 1);
  // SAFETY: safety gap is 90mm
  echo(safety_gap = spacing - b45x90[1]);

  for (safety_index = [0: safety_rungs - 1]) {
    is_top = safety_index == 0;
    top = post_height - (safety_index * spacing);
    // echo(safety_index = safety_index, safety_top = top);

    translate([0, 0, top])
    safety_rail(is_top);
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
else assert(false, str("unknown view: ", view, " (see header for valid names)"));
