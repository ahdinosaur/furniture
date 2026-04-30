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
- 4x safety rail sides: `bed_width` = 1090mm
- Total 45x90 length: ~56.5m (need 10x 6m sticks = 60m of stock)

12mm plywood panels:
- 1x bed panel: `bed_width` x `bed_length` = 1090mm x 2050mm
  - Note, this could instead have a length of (2050mm + 4 * 90mm), with notches for the posts cut out.
  - Also Note, this should have holes in it for the bed mattress to breathe.
- 1x back support panel: (`bed_length` + 4x 45mm) x `support_height` = 2230mm x 600mm
- 1x side-a support panel: `bed_width` x `support_height` = 1090mm x 600mm

PVA wood glue (for post lamination only — all other joints are bolted for disassembly):
- https://www.bunnings.co.nz/parfix-pva-wood-glue-250ml-250ml_p0830569

Polyeurethane interior varnish:
- https://www.resene.co.nz/homeown/painting-your-home/woodcare7.htm

Screws (post lamination only — ~80 needed for 8 posts):
- "75mm 14g Type 17 bugle-head batten screw" (Titan 100-pack)
  - https://www.bunnings.co.nz/titan-14g-x-75mm-zinc-gold-timber-bugle-batten-screw-100-pack_p0579085
- 8-10 screws per post in a staggered pattern, ~250-300mm apart along the 2435mm post.

Bolts — M10 hot-dip galvanised coach (carriage) bolts + M10 flat washer + M10 Nyloc nut.
Two lengths, sized to the timber they pass through:
- Coach bolts are the local NZ equivalent to "furniture bolts": the square neck under
  the dome head locks into the wood so only the nut turns. Hex bolts also work but
  need a spanner on the head and a washer on the head side.
- 150mm bolts pass through 135mm of timber (3 layers x 45mm) with ~15mm protruding
  for washer + nut. Used for the standard joints.
- 200mm bolts pass through 180mm of timber (4 layers x 45mm) with ~20mm protruding,
  used only at the top rung / bed-frame intersection on side "b" — one bolt through
  all 4 layers (rung + outer post + inner post + bed-frame support) secures both the
  rung and the bed frame at once, so the two bolt patterns don't clash.

Bolt count:
- Side "a" bed frame to posts: 2 joints x 4 = 8x M10 x 150mm (135mm joints)
- Side "b" bed frame + top rung to posts: 2 joints x 4 = 8x M10 x 200mm (180mm joints, dual-purpose)
- Lower 5 ladder rungs to posts: 10 joints x 2 = 20x M10 x 150mm (135mm joints)
- Total: 28x M10 x 150mm + 8x M10 x 200mm coach bolts; 36 flat washers; 36 Nyloc nuts.
- (Safety rails attachment is TBD — same fastener pattern applies if you want full disassembly.)

## Tools

Cutting (at home, rough -> final length):
- Mitre saw, or circular saw + speed square (accurate cross-cuts)
- Jigsaw or circular saw with a fine plywood blade (for the panels)
- Tape measure, pencil, combination square
- Sawhorses or work bench

Drilling — post lamination (75mm batten screws):
- Cordless drill/driver
- 5.5mm twist bit (clearance hole through the first 45mm board)
- 4mm twist bit (pilot at the board ends and through any knots)
- Driver bit matching the screw head — Titan 14g bugle batten is
  typically square drive #3, but check the box.

Drilling — bolted joints (M10 coach bolts):
- 11mm auger bit, ~300mm long. Standard 230mm augers only have
  ~165mm of flute, which is too short for the 180mm 4-layer joint.
  - Alternative: drill a 6mm pilot first, then open up to 11mm with
    a shorter auger from each side — keeps the holes aligned without
    needing the long bit.
- 17mm socket + ratchet for the M10 Nyloc nut. The square neck under
  the coach bolt head locks into the wood, so only the nut turns —
  no second spanner needed on the head.
- 4-6 quick clamps to hold the layer stack square while drilling
  through all 3 or 4 layers in one pass — keeps every bolt hole aligned.

Drilling — plywood breathing holes (bed panel only):
- 25mm Forstner bit. Forstner bits leave clean, flat-bottomed holes
  in 12mm plywood. Spade and auger bits tear out the back face of
  plywood badly, even with a backer.
  - Alternative: 25mm hole saw + arbor (slower but tidy).
- Drill from the top face with a sacrificial scrap clamped under the
  panel to prevent blow-out on the underside.
- Layout: ~150mm grid. For the 1090 x 2050 panel that is ~6 columns
  x 13 rows = ~80 holes. Skip the rows that land directly above the
  bed-frame joists — drilling there gains nothing.

Gluing & finishing:
- Glue spreader or small roller (PVA on the post mating faces)
- 4-6 quick clamps or sash clamps (hold the post pair during cure)
- Damp rag (wipe glue squeeze-out before it sets)
- Random-orbital sander or sanding block (80 / 120 / 180 grit)
- Brush or short-nap roller for the polyurethane varnish

PPE & general:
- Safety glasses (cutting, drilling)
- Dust mask (plywood dust, sanding fines)
- Hearing protection (mitre saw, long auger drilling)

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

Total yield: 8 posts + 8 safety rails + 3 bed frames + 12 shorts (0 spare).

At home (accurate cut, square one end of each rough piece, then trim to final length):

- post-rough (2480mm) -> 1 post (2435mm), 45mm margin
- safety-rail-rough (2380mm) -> 1 safety rail (2230mm), 150mm margin
- bed-frame-rough (2380 or 2480mm) -> 1 bed frame (2050mm), 330 or 430mm margin
- short-rough (~1134mm) -> 1 short (1090mm), ~44mm margin
- rung-pair-rough (2480mm) -> 2 shorts (1090mm each); cut down the middle, then trim each

Shorts are interchangeable: 6 -> ladder rungs, 2 -> bed frame supports, 4 -> safety rail sides.


## Assembly

Posts (laminate two 45x90s into one 90x90):

- Apply PVA glue across both mating faces — glue is the primary fastener;
  screws are clamps during cure.
- Drive 75mm 14g Type 17 bugle-head batten screws in a staggered pattern,
  ~250-300mm apart along the 2435mm post (~8-10 screws per post).
  - Drill 5.5mm clearance holes through the first board only — threads
    bite the second board and pull the joint tight against the glue.
  - Drill a 4mm pilot for the end screws (within ~75mm of either end)
    to avoid splitting end grain.
  - Pre-drill anywhere you hit a knot.

All bolted joints — common procedure:

- Drill 11mm clearance hole all the way through. Use an 11mm auger bit, or
  drill a 6mm pilot first then open up to 11mm from each side.
- Coach bolt head sits on the outer face (square neck bites in); flat
  washer + Nyloc nut on the inner face.
- Do NOT glue — bolts are what makes the structure disassemblable for transport.

Lower 5 ladder rungs to posts (side "b" only, 10 joints, 135mm of timber):

- 2x M10 x 150mm coach bolts per rung-end in a diagonal pattern.
- Bolt traverses rung (45) + outer post (45) + inner post (45) = 135mm.
- We might want to put wood in the empty slots between rungs.

Side "a" bed frame to posts (2 joints, 135mm of timber):

- 4x M10 x 150mm coach bolts per joint in a square pattern within the
  90x90 contact area where the bed-frame support meets the post pair.
- Bolt traverses outer post (45) + inner post (45) + bed-frame support (45)
  = 135mm.

Side "b" bed frame + top rung to posts (2 joints, 180mm of timber):

- 4x M10 x 200mm coach bolts per joint in a square pattern. These bolts
  secure rung AND bed frame in one fastener — same bolt does both jobs,
  so the two attachment patterns don't clash.
- Bolt traverses rung (45) + outer post (45) + inner post (45) + bed-frame
  support (45) = 180mm.

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

module panel_yz(length, width) {
  cube([panel_thickness, length, width]);
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

module safety_rail(is_top, is_bottom) {
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

  if (is_bottom) {
    color("pink")
    translate([
      bed_length + 2 * b45x90[0],
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
    is_bottom = safety_index == safety_rungs - 1;
    top = post_height - (safety_index * spacing);
    // echo(safety_index = safety_index, safety_top = top);

    translate([0, 0, top])
    safety_rail(is_top, is_bottom);
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

loft();
