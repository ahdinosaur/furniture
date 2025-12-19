b2x4 = [45, 90];
b2x6 = [45, 140];
b2x8 = [45, 190];
b2x10 = [45, 240];
b2x12 = [45, 290];
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
  beam_zx(b2x6, post_height);

  color("blue")
  translate([
    0,
    b2x6[0],
  ])
  beam_zy(b2x6, post_height);
}

module posts() {
  translate([
    -b2x6[0],
    -b2x6[0],
  ])
  post();

  translate([
    bed_length + b2x6[0],
    -b2x6[0],
  ])
  mirror([1, 0, 0])
  post();

  translate([
    -b2x6[0],
    bed_width + b2x6[0],
  ])
  mirror([0, 1, 0])
  post();

  translate([
    bed_length + b2x6[0],
    bed_width + b2x6[0],
  ])
  mirror([1, 0, 0])
  mirror([0, 1, 0])
  post();
}

module rails_inner(front) {
  if (front) {
    beam_xz(b2x4, bed_length);
  }

  translate([
    0,
    bed_width - b2x4[0],
  ])
  beam_xz(b2x4, bed_length);

  translate([
    0,
    b2x4[0],
  ])
  beam_yz(b2x4, bed_width - 2 * b2x4[0]);

  translate([
    bed_length - b2x4[0],
    b2x4[0],
  ])
  beam_yz(b2x4, bed_width - 2 * b2x4[0]);
}

module safety_rail() {
  translate([
    -2 * b2x6[0],
    -2 * b2x6[0],
  ])
  beam_xz(b2x4, bed_length + 3 * b2x6[0]);

  translate([
    -2 * b2x6[0],
    bed_width + b2x6[0],
  ])
  beam_xz(b2x4, bed_length + 3 * b2x6[0]);

  translate([
    -2 * b2x6[0],
    -b2x6[0],
  ])
  beam_yz(b2x4, bed_width + 2 * b2x6[0]);
}

// bed frame
module bed_frame() {
  rails_inner(true);

  translate([
    0,
    0,
    b2x4[1],
  ])
  bed_slats();
}

// bed slats
module bed_slats() {
  for (slat_index = [0 : slat_count - 1]) {
    space = (slat_index / (slat_count - 1)) * (bed_length - slat_width);

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
    space = (safety_index / safety_count) * (safety_distance - b2x4[1]);

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
  beam_yx(b2x12, step_length);

  // for each step
  for (step_index = [0 : step_count - 1]) {
    step_height = (step_length + b2x12[0]) / step_count;
    next_length = (1 - step_index / step_count) * step_length;
    bottom = (step_index / (step_count - 1)) * bed_height;

    translate([
      0,
      step_length - next_length,
      bottom,
    ]) {
      // step shelf
      beam_yx(b2x12, next_length);

      // step front side
      if (step_index != 0) {
        translate([
          0,
          0,
          -step_height + b2x12[0],
        ])
        beam_zx(b2x12, step_height - b2x12[0]);
      }
    }
  }

  // back side
  translate([
    0,
    step_length,
    0,
  ])
  beam_zx(b2x12, bed_height + b2x12[0]);
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
    bed_length + b2x6[0],
    bed_width - step_length,
    0,
  ])
  steps();
}

loft();
