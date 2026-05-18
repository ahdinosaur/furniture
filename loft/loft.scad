/*

# Loft

## Guides

- https://www.productsafety.gov.au/business/search-mandatory-standards/bunk-beds-mandatory-standard

## Bill of Materials

45x90 timber:
- 8x posts: `post_height` = 2435mm
- 16x ladder rungs: `bed_width` = 1090mm
- 3x bed frames: `bed_length` + 6x 45mm = 2320mm
- 2x bed frame safety: `bed_width` - 2x 90mm = 910mm
- 8x safety rails: same as "bed frames" = 2320mm
- Total 45x90 length: ~64.3m (before cutting waste)

12mm plywood panels:
- 1x bed panel: `bed_width` x `bed_length` = 1090mm x 2050mm
- 1x support panel: (`bed_length` + 6x 45mm) x `support_height` = 2320mm x 600mm

Polyeurethane glue:
- https://www.placemakers.co.nz/online/adhesives-sealants/adhesives-sealants/adhesives/specialty-adhesives/glue-premium-3-hour-cure-500ml/p/4472404

Polyeurethane interior varnish:
- https://www.placemakers.co.nz/online/paint-decorating/paint/woodcare/woodcare-interior/heavy-duty-varnish-interior-satin/p/5449856
- https://www.placemakers.co.nz/online/paint-decorating/paint/woodcare/woodcare-interior/cabothane-clear-oil-based-satin-4l-86482030-4lz/p/4017878

Screws:
- "125mm 14g Type 17 bugle-head batten screw"
  - https://www.mitre10.co.nz/shop/building-king-bugle-head-batten-screw-125mm-x-14g-class-4-galvanised/p/389338

Bolts:
- 16x M10 furniture bolts (4 in a square per side, 4 sides)

## Cut list


## Assembly

Sides:

- The rungs and posts should be screwed _and_ glued with polyeurethane glue.
- The rungs should attach to the posts with 3x screws in a triangle.
- The screws must be just less than 3 * 45 = 135mm
- We might want to put wood in the empty slots between rungs



Bed to sides:

- Use M10 furniture bolts, 4 in a square.

*/

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
ladder_gap = 235;
ladder_spacing = ladder_gap + b45x90[1];
ladder_height = b45x90[1] + (ladder_rungs - 1) * ladder_spacing;
ladder_notch = 20;
// SAFETY: end gap is 235mm
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

// SAFETY: end gap is 55mm
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

module post() {
  difference() {
    union() {
      post_front();
      post_back();
    }

    translate([
      - eps,
      b45x90[1] - ladder_notch + eps,
      0,
    ])
    ladder_rungs_iter() {
      beam_yx(b45x90 + [2 * eps, 2 * eps], ladder_notch + eps);
    }
  }
}

module side(side_id) {
  post();

  translate([0, bed_width]) {
    mirror([0, 1, 0])
    post();
  }

  ladder_rungs_iter(print = true) {
    /*
    translate([0, b45x90[1] - ladder_notch, 0])
    color("red")
    beam_yx(b45x90, bed_width - 2 * (b45x90[1] - ladder_notch));
    */
  }
}

module ladder_rungs_iter(print = false) {
  spacing = (ladder_height - 2 * b45x90[0]) / (ladder_rungs - 1);
  if (print) {
    // SAFETY: ladder gap is 235mm
    echo(ladder_gap = spacing - b45x90[1]);
  }

  for (ladder_index = [0: ladder_rungs - 1]) {
    top = ladder_height - (ladder_index * spacing);

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

  // safety sides, to reduce the gaps to be within guidelines
  color("teal")
  translate([2 * b45x90[0], b45x90[1], b45x90[1]])
  beam_yz(b45x90, bed_width - 2 * b45x90[1]);

  color("teal")
  translate([bed_length + 3 * b45x90[0], b45x90[1], b45x90[1]])
  beam_yz(b45x90, bed_width - 2 * b45x90[1]);
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
  spacing = (post_height - bed_height - 2 * b45x90[1]) / (safety_rungs - 1);
  // SAFETY: safety gap is 90mm
  echo(safety_gap = spacing - b45x90[1]);

  for (safety_index = [0: safety_rungs - 1]) {
    top = post_height - (safety_index * spacing);
    // echo(safety_index = safety_index, safety_top = top);

    translate([0, 0, top])
    safety_rail();
  }
}

module loft() {
  translate([
    -3 * b45x90[0],
    0,
  ])
  side("a");

  translate([
    bed_length,
    0,
  ])
  side("b");

  translate([
    -3 * b45x90[0],
    0,
    bed_height
  ])
  bed_frame();

  support_panel();

  safety_rails();
}

loft();
