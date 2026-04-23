b45x90 = [45, 90];
b45x140 = [45, 140];
b45x190 = [45, 190];
b45x240 = [45, 240];
b45x290 = [45, 290];
b25x100 = [25, 100];
b25x150 = [25, 150];
b25x200 = [25, 200];
b25x300 = [25, 300];
post_height = 1800;
bed_height = 1200;
bed_length = 1910;
bed_width = 1000;
panel_thickness = 12;
slat_count = 6;
slat_width = 200;
safety_count = 3;
step_length = 1400;
step_count = 6;

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

// post

module post() {
  color("green")
  beam_zy(b45x90, post_height);

  color("blue")
  translate([
    b45x140[0],
    0,
  ])
  beam_zx(b45x90, post_height);

  color("blue")
  translate([
    b45x140[0],
    b45x140[0],
  ])
  beam_zx(b45x90, post_height);
}

module posts() {
  // left front
  translate([
    -b45x140[0],
    -b45x140[0],
  ])
  post();

  // right front
  translate([
    bed_length + b45x140[0],
    -b45x140[0],
  ])
  mirror([1, 0, 0])
  post();

  // left back
  translate([
    -b45x140[0],
    bed_width + b45x140[0],
  ])
  mirror([0, 1, 0])
  post();

  // right back
  translate([
    bed_length + b45x140[0],
    bed_width + b45x140[0],
  ])
  mirror([1, 0, 0])
  mirror([0, 1, 0])
  post();
}

module rails_inner(front) {
  // front
  if (front) {
    color("yellow")
    beam_xz(b45x90, bed_length);
  }

  // back
  color("yellow")
  translate([
    0,
    bed_width - b45x90[0],
  ])
  beam_xz(b45x90, bed_length);

  // left
  color("yellow")
  translate([
    0,
    b45x90[0],
  ])
  beam_yz(b45x90, bed_width - 2 * b45x90[0]);

  // right
  color("yellow")
  translate([
    bed_length - b45x90[0],
    b45x90[0],
  ])
  beam_yz(b45x90, bed_width - 2 * b45x90[0]);
}

module safety_rail() {
  // front
  color("pink")
  translate([
    -2 * b45x140[0],
    -2 * b45x140[0],
  ])
  beam_xz(b45x90, bed_length + 3 * b45x140[0]);

  // back
  color("pink")
  translate([
    -2 * b45x140[0],
    bed_width + b45x140[0],
  ])
  beam_xz(b45x90, bed_length + 3 * b45x140[0]);

  // left
  color("pink")
  translate([
    -2 * b45x140[0],
    -b45x140[0],
  ])
  beam_yz(b45x90, bed_width + 2 * b45x140[0]);
}

// bed frame
module bed_frame() {
  rails_inner(true);

  translate([
    0,
    0,
    b45x90[1],
  ])
  bed_slats();
}

// bed slats
module bed_slats() {
  for (slat_index = [0 : slat_count - 1]) {
    space = (slat_index / (slat_count - 1)) * (bed_length - slat_width);

    color("purple")
    translate([
      space,
      0,
    ])
    panel_xy(slat_width, bed_width);
  }
}

// support braces
module support_braces() {
  rails_inner(false);
}

// safety rails
module safety_rails() {
  safety_distance = post_height - bed_height;

  // for each safety rail
  for (safety_index = [1 : safety_count]) {
    space = (safety_index / safety_count) * (safety_distance - b45x90[1]);

    translate([
      0,
      0,
      space,
    ])
    safety_rail();
  }
}

module steps() {
  // bottom shelf
  color("orange")
  beam_yx(b45x290, step_length);

  // for each step
  for (step_index = [0 : step_count - 1]) {
    step_height = step_length / step_count;
    next_length = (1 - step_index / step_count) * step_length;
    bottom = ((step_index + 1) / (step_count)) * bed_height;

    translate([
      0,
      step_length - next_length,
      bottom,
    ]) {
      // step shelf
      color("orange")
      beam_yx(b45x290, next_length);

      // step front side
      color("orange")
      translate([
        0,
        0,
        -step_height + b45x290[0],
      ])
      beam_zx(b45x290, step_height - b45x290[0]);
    }
  }

  // back side
  color("orange")
  translate([
    0,
    step_length,
    0,
  ])
  beam_zx(b45x290, bed_height + b45x290[0]);
}

module loft() {
  posts();

  translate([
    0,
    0,
    bed_height,
  ]) {
    bed_frame();

    safety_rails();
  }

  support_braces();

  translate([
    bed_length + b45x140[0],
    bed_width - step_length,
    0,
  ])
  steps();
}

loft();
