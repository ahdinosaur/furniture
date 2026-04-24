/*

Assembly:

Sides:

- The rungs and posts should be screwed _and_ glued with polyeurethane glue.
- The rungs should attach to the posts with 3x screws in a triangle.
- The screws must be just less than 3 * 45 = 135mm
- We might want to put wood in the empty slots between rungs



Bed to sides:

- Use M10 furniture bolts, 4 in a square.

*/

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
post_height = 2200;
bed_height = 1800;
bed_length = 1910;
bed_width = 1070;
panel_thickness = 12;
slat_count = 6;
slat_width = 200;
ladder_rungs = 8;
safety_count = 3;
support_bottom = 200;
support_height = 600;

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

module post_front() {
  color("green")
  beam_zy(b45x90, post_height);
}

module post_back() {
  color("blue")
  translate([
    b45x90[0] * 2,
    0
  ])
  beam_zy(b45x90, post_height);
}

module side_rung(beam_size, top) {
  color("red")
  translate([0, 0, top - beam_size[1]])
  beam_yz(beam_size, bed_width + 2 * b45x90[1]);
}

module side() {
  post_front();
  post_back();

  translate([0, bed_width + b45x90[1]]) {
    post_front();
    post_back();
  }

  for (ladder_index = [0: ladder_rungs - 1]) {
    side_rung_beam = (ladder_index == 0 || ladder_index == ladder_rungs - 1) ? b45x90 : b45x45;

    top = bed_height - (ladder_index / (ladder_rungs - 1)) * (bed_height - side_rung_beam[1]);

    translate([b45x90[0], 0])
    side_rung(side_rung_beam, top);
  }
}

module bed_frame() {
  color("yellow")
  beam_xz(b45x90, bed_length + b45x90[0] * 6);

  color("yellow")
  translate([0, bed_width - b45x90[0]])
  beam_xz(b45x90, bed_length + b45x90[0] * 6);
}

module support_panel() {
  color("yellow")
  translate([
    -3 * b45x90[0],
    bed_width + b45x90[1],
    support_bottom,
  ])
  panel_xz(bed_length + 6 * b45x90[0], support_height);
}

module loft() {
  translate([
    -3 * b45x90[0],
    -b45x90[1],
  ])
  side();

  translate([
    bed_length,
    -b45x90[1],
  ])
  side();

  translate([
    -3 * b45x90[0],
    0,
    bed_height
  ])
  bed_frame();

  support_panel();
}

echo(version=version());
loft();
