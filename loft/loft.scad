/*

TODO:

- Add middle rail under mattress
- Add plywood sheet on rails under matress
  - Design ventilation pattern to cut at CNC shop
    - Hexagon vents?
- Add plywood sheet on sides for safety
  - Design something cool for sides to cut at CNC shop
    - A rainbow?
  - This will double as the bottom side panel for bracing

Guides:

- https://www.productsafety.gov.au/business/search-mandatory-standards/bunk-beds-mandatory-standard

Bill of Materials:

- 8x posts: `post_height` = 2400mm
- 16x ladder rungs: `bed_width` = 1090mm
- 3x bed frames: `bed_length` + 6x 90mm = 2590mm
- 1x bed panel: `bed_width` x `bed_length` = 1090mm x 2050mm
- 6x safety rails: same as "bed frames" = 2590mm
- 1x support panel
- polyeurethane glue:
  - https://www.placemakers.co.nz/online/adhesives-sealants/adhesives-sealants/adhesives/specialty-adhesives/glue-premium-3-hour-cure-500ml/p/4472404
- polyeurethane interior varnish:
  - https://www.placemakers.co.nz/online/paint-decorating/paint/woodcare/woodcare-interior/heavy-duty-varnish-interior-satin/p/5449856
  - https://www.placemakers.co.nz/online/paint-decorating/paint/woodcare/woodcare-interior/cabothane-clear-oil-based-satin-4l-86482030-4lz/p/4017878
- screws:
  - "125mm 14g Type 17 bugle-head batten screw"
    - https://www.mitre10.co.nz/shop/building-king-bugle-head-batten-screw-125mm-x-14g-class-4-galvanised/p/389338


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
bed_height = 1740;
post_height = 2400;
bed_length = 2030 + 20; // 10mm clearance on each side
bed_width = 1070 + 20; // 10mm clearance on each side
side_width = bed_width - 2 * b45x90[1];
panel_thickness = 12;
slat_count = 6;
slat_width = 200;
ladder_rungs = 8;
safety_rungs = 3;
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

module side_rung(top) {
  color("red")
  translate([0, 0, top - b45x90[1]])
  beam_yz(b45x90, bed_width);
}

module side() {
  post_front();
  post_back();

  translate([0, bed_width - b45x90[1]]) {
    post_front();
    post_back();
  }

  gap = (post_height - 2 * b45x90[0]) / (ladder_rungs - 1);
  echo(ladder_gap = gap);

  for (ladder_index = [0: ladder_rungs - 1]) {
    top = post_height - (ladder_index * gap);
    echo(ladder_index = ladder_index, ladder_top = top);

    translate([b45x90[0], 0])
    side_rung(top);
  }
}

module bed_frame() {
  color("yellow")
  translate([0, b45x90[1]])
  beam_xz(b45x90, bed_length + b45x90[0] * 6);

  color("yellow")
  translate([0, b45x90[1] + (1/2) * (side_width - b45x90[0])])
  beam_xz(b45x90, bed_length + b45x90[0] * 6);

  color("yellow")
  translate([0, side_width + b45x90[0]])
  beam_xz(b45x90, bed_length + b45x90[0] * 6);

  color("orange")
  translate([3 * b45x90[0], 0, b45x90[1]])
  panel_xy(bed_length, bed_width);
}

module support_panel() {
  color("purple")
  translate([
    -3 * b45x90[0],
    bed_width,
    support_bottom,
  ])
  panel_xz(bed_length + 6 * b45x90[0], support_height);
}

module safety_rail() {
  // front
  color("pink")
  translate([
    -3 * b45x90[0],
    -1 * b45x90[0],
    -b45x90[1],
  ])
  beam_xz(b45x90, bed_length + 6 * b45x90[0]);

  // back
  color("pink")
  translate([
    -3 * b45x90[0],
    bed_width,
    -b45x90[1],
  ])
  beam_xz(b45x90, bed_length + 6 * b45x90[0]);
}

module safety_rails() {
  gap = (post_height - bed_height - 2 * b45x90[1]) / (safety_rungs - 1);
  echo(safety_gap = gap);

  for (safety_index = [0: safety_rungs - 1]) {
    top = post_height - (safety_index * gap);
    echo(safety_index = safety_index, safety_top = top);

    translate([0, 0, top])
    safety_rail();
  }
}

module loft() {
  translate([
    -3 * b45x90[0],
    0,
  ])
  side();

  translate([
    bed_length,
    0,
  ])
  side();

  translate([
    -3 * b45x90[0],
    0,
    bed_height
  ])
  bed_frame();

  support_panel();

  safety_rails();
}

echo(version=version());
loft();
