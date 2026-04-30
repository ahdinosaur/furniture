/*

# Loft

## Guides

- https://www.productsafety.gov.au/business/search-mandatory-standards/bunk-beds-mandatory-standard

## Bill of Materials

45x90 timber:
- 8x posts: `post_height` = 2435mm
- 6x ladder rungs: `bed_width` = 1090mm
- 3x bed frame joists: `bed_length` = 2050mm
- 2x bed frame supports: `bed_width` = 1090mm
- 8x safety rails: `bed_length` + 4x 45mm = 2230mm
- 3x safety rail sides: `bed_width` = 1090mm
- Total 45x90 length: ~55.5m (need 10x 6m sticks = 60m of stock)

12mm plywood panels:
- 1x bed panel: `bed_width` x `bed_length` = 1090mm x 2050mm
- 1x back support panel: (`bed_length` + 6x 45mm) x `support_height` = 2320mm x 600mm
- 1x side-a support panel: (`bed_width` + 6x 45mm) x `support_height` = 1360mm x 600mm

PVA wood glue:
- https://www.bunnings.co.nz/parfix-pva-wood-glue-250ml-250ml_p0830569

Polyeurethane interior varnish:
- https://www.resene.co.nz/homeown/painting-your-home/woodcare7.htm

Screws:
- "125mm 14g Type 17 bugle-head batten screw"
  - https://www.mitre10.co.nz/shop/building-king-bugle-head-batten-screw-125mm-x-14g-class-4-galvanised/p/389338

Bolts:
- 16x M10 furniture bolts (4 in a square per side, 4 sides)

## Cut list

Stock: 10x 6m lengths of 45x90.

PlaceMakers (rough cut, every piece must fit Toyota Hiace at <= 2700mm):

For each stick, 2 cuts:
"First piece 2480mm, second piece 2380mm, leave the rest."
The remainder is the third piece (~1134mm after kerf). 20 cuts total.

Allocation of the 30 rough pieces:

- 8 sticks: 2480 -> post-rough,       2380 -> safety-rail-rough, ~1134 -> short-rough
- 1 stick:  2480 -> bed-frame-rough,  2380 -> bed-frame-rough,   ~1134 -> short-rough
- 1 stick:  2480 -> rung-pair-rough,  2380 -> bed-frame-rough,   ~1134 -> short-rough

Total yield: 8 posts + 8 safety rails + 3 bed frames + 12 shorts (1 spare).

At home (accurate cut, square one end of each rough piece, then trim to final length):

- post-rough (2480mm) -> 1 post (2435mm), 45mm margin
- safety-rail-rough (2380mm) -> 1 safety rail (2230mm), 150mm margin
- bed-frame-rough (2380 or 2480mm) -> 1 bed frame (2050mm), 330 or 430mm margin
- short-rough (~1134mm) -> 1 short (1090mm), ~44mm margin
- rung-pair-rough (2480mm) -> 2 shorts (1090mm each); cut down the middle, then trim each

Shorts are interchangeable: 6 -> ladder rungs, 2 -> bed frame supports, 3 -> safety rail sides, 1 spare.


## Assembly

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

ladder_rungs = 6;
ladder_gap = 235;
ladder_spacing = ladder_gap + b45x90[1];
ladder_height = b45x90[1] + (ladder_rungs - 1) * ladder_spacing;
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

module post() {
  color("green")
  beam_zy(b45x90, post_height);

  translate([
    b45x90[0],
    0
  ])
  beam_zy(b45x90, post_height);
}

module side_rung(top) {
  color("red")
  translate([0, 0, top - b45x90[1]])
  beam_yz(b45x90, bed_width);
}

module side(side_id) {
  post();

  translate([0, bed_width - b45x90[1]]) {
    post();
  }

  spacing = (ladder_height - 2 * b45x90[0]) / (ladder_rungs - 1);
  if (side_id == "a") {
    // SAFETY: ladder gap is 235mm
    echo(ladder_gap = spacing - b45x90[1]);
  }

  if (side_id != "a" || side_id == "b") {
    for (ladder_index = [0: ladder_rungs - 1]) {
      top = ladder_height - (ladder_index * spacing);
      if (side_id == "a") {
        echo(ladder_index = ladder_index, ladder_top = top);
      }

      side_rung_x_offset = side_id == "a" ? -1 * b45x90[0] : 2 * b45x90[0];
      translate([side_rung_x_offset, 0])
      side_rung(top);
    }
  }
}

module bed_frame() {
  color("yellow")
  translate([0, b45x90[1]])
  beam_xz(b45x90, bed_length);

  color("yellow")
  translate([0, b45x90[1] + (1/2) * (side_width - b45x90[0])])
  beam_xz(b45x90, bed_length);

  color("yellow")
  translate([0, side_width + b45x90[0]])
  beam_xz(b45x90, bed_length);

  color("orange")
  translate([0, 0, b45x90[1]])
  panel_xy(bed_length, bed_width);

  // support sides
  color("cyan")
  translate([0, 0, -b45x90[1]])
  beam_yz(b45x90, bed_width);

  color("cyan")
  translate([bed_length - b45x90[0], 0, -b45x90[1]])
  beam_yz(b45x90, bed_width);
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
    translate([0, 0, 0])
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

  support_panel();

  safety_rails();
}

loft();
