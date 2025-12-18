beam_size = [45, 90];
post_height = 1800;
bed_height = 1200;
bed_length = 1910;
bed_width = 750;
ladder_height = 1200;
ladder_rungs = 5;
panel_thickness = 12;
support_bottom = 200;
support_height = 600;

// beams
module beam_zy(length) {
  cube([beam_size[0], beam_size[1], post_height]);
}

module beam_yz(length) {
  cube([beam_size[0], length, beam_size[1]]);
}

module beam_xz(length) {
  cube([length, beam_size[0], beam_size[1]]);
}

module beam_xy(length) {
  cube([length, beam_size[1], beam_size[0]]);
}

module panel_xy(length, width) {
  cube([length, width, panel_thickness]);
}

module panel_xz(length, width) {
  cube([length, panel_thickness, width]);
}

module post_front() {
  color("green")
  beam_zy(post_height);
}

module post_back() {
  color("blue")
  translate([
    beam_size[0] * 2,
    0
  ])
  beam_zy(post_height);
}

module side_rung(top) {
  color("red")
  translate([0, 0, top - 2 * beam_size[0]])
  beam_yz(bed_width + 2 * beam_size[1]);
}

module side() {
  post_front();
  post_back();

  translate([0, bed_width + beam_size[1]]) {
    post_front();
    post_back();
  }

  for (ladder_index = [0: ladder_rungs]) {
    top = ladder_height - (ladder_index / ladder_rungs) * (ladder_height - 2 * beam_size[0]);

    translate([beam_size[0], 0])
    side_rung(top);
  }
}

module bed_frame() {
  color("yellow")
  beam_xz(bed_length + beam_size[0] * 6);

  color("yellow")
  translate([0, bed_width - beam_size[0]])
  beam_xz(bed_length + beam_size[0] * 6);
}

module support_panel() {
  color("yellow")
  translate([
    -3 * beam_size[0],
    bed_width + beam_size[1],
    support_bottom,
  ])
  panel_xz(bed_length + 6 * beam_size[0], support_height);
}

module loft() {
  translate([
    -3 * beam_size[0],
    -beam_size[1],
  ])
  side();

  translate([
    bed_length,
    -beam_size[1],
  ])
  side();

  translate([
    -3 * beam_size[0],
    0,
    bed_height
  ])
  bed_frame();

  support_panel();
}

echo(version=version());
loft();
