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
  - Resene Aquaclear
- https://www.resene.co.nz/Colorwood.htm
  - Resene Colorwood: "Rock Salt"
    - OR... "Rising Tide"

Screws (post lamination only — ~80 needed for 8 posts):
- "75mm 14g Type 17 bugle-head batten screw" (Titan 100-pack)
  - https://www.bunnings.co.nz/titan-14g-x-75mm-zinc-gold-timber-bugle-batten-screw-100-pack_p0579085
- 8-10 screws per post in a staggered pattern, ~250-300mm apart along the 2435mm post.

Bolts — coach (carriage) bolts + flat washer + Nyloc nut. Two sizes:
- Coach bolts are the local NZ equivalent to "furniture bolts": the square neck under
  the dome head locks into the wood so only the nut turns. Hex bolts also work but
  need a spanner on the head and a washer on the head side.
- M6 x 150mm zinc-plated for the standard 135mm joints (rail/rung/support + post pair,
  3 layers x 45mm with ~15mm protruding for washer + nut). Pine SG8 bearing capacity
  gives ~4x safety factor on the worst-loaded joint (bed frame), and 25mm edge distance
  in the diagonal pattern works out to ~4x the bolt diameter — very generous.
- M10 x 200mm hot-dip galvanised for the 4 dual-purpose side "b" joints at the top
  rung / bed-frame intersection (4 layers x 45mm = 180mm of timber + ~20mm protrusion).
  The 200mm bolt is in bending across all 4 layers, and bending stress favours larger
  diameter — M10, not M6, here. One bolt secures both the rung and the bed-frame
  support, so the two bolt patterns don't clash.

Bolt count (every bolted joint uses 2 coach bolts on a diagonal across
the 90x90 contact patch — see the ASCII diagram in the Assembly section):
- Side "a" bed frame to posts: 2 joints x 2 = 4x M6 x 150mm
- Side "b" bed frame + top rung to posts: 2 joints x 2 = 4x M10 x 200mm (dual-purpose)
- Lower 5 ladder rungs to posts: 10 joints x 2 = 20x M6 x 150mm
- Safety rails to posts: 24 joints x 2 = 48x M6 x 150mm
  - 8 horizontal (front/back) rails x 2 ends = 16 joints
  - 4 side rails x 2 ends = 8 joints
- Total: 72x M6 x 150mm coach bolts + 72x M6 flat washers + 72x M6 Nyloc nuts.
         4x M10 x 200mm coach bolts + 4x M10 flat washers + 4x M10 Nyloc nuts.

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

Drilling — bolted joints:
- 7mm bit for the 72 M6 coach bolt holes. Standard clearance for M6 coach: square
  neck (~7.4mm across flats) bites the wood when the bolt is tapped firmly home with
  a mallet. Deepest single hole is 90mm (through the laminated post pair), past the
  flute of a standard jobber-length 7mm twist bit (~70mm) — use an extra-long twist,
  a 7mm brad-point, or a 7mm auger for those holes.
- 11mm auger: Irwin 11 x 200/125mm (200mm overall, 125mm flute) for the 4 M10 x 200mm
  bolts at the side "b" dual-purpose joints — only 8 holes total but the auger is the
  right tool.
  - https://www.bunnings.co.nz/irwin-11-x-200-125mm-auger_p0355156
  - 11mm is the textbook clearance for the M10 coach-bolt square neck to bite
    cleanly on its flats — no mallet-and-hope needed.
  - 125mm flute is well past the deepest single hole on this build (90mm through
    the laminated post pair). Each part is drilled separately, not through stacked
    layers, so flute length isn't a constraint.
  - Auger technique: start at low RPM to let the screw tip engage straight, keep
    both hands on the drill (augers cut aggressively and can torque the drill out
    of your hand if they catch), and clamp a sacrificial scrap under the exit face
    for a clean back.
- 10mm socket + ratchet for the M6 Nyloc nuts.
- 17mm socket + ratchet for the 4 M10 Nyloc nuts.
- If a bolt spins under nut torque, tap it in harder to re-seat the square neck, or
  grip the dome head with vise grips. (Or use hex bolts with a washer under the head
  — no neck-bite needed at all.)
- Marking gauge or combination square + sharp pencil for transferring matching hole
  positions between parts.
- Mark the 4 M10 x 200mm bolts clearly (paint dot, tape, or separate bag) so they
  end up at the side "b" top rung / bed-frame joints during assembly, not buried in
  the M6 pile.

Drilling — plywood breathing holes (bed panel only):
- 25mm Forstner bit.
  - https://www.bunnings.co.nz/irwin-1-25mm-forstner-bit_p0355141
  - Forstner bits leave clean, flat-bottomed holes
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
- Resene No Loss Speed Brush, 125mm, for the Aquaclear varnish.
  - https://shop.resene.co.nz/key-accessories/speedbrushes
  - Synthetic bristles (water-based-compatible), flat dense pack
    holds enough product for long strokes that self-level before
    skinning over. 125mm matches the 90mm post faces well and is
    still workable on the larger plywood panels — 175mm would be
    faster on the panels but awkward on the 45mm edges of the rails
    and rungs.

PPE & general:
- Safety glasses (cutting, drilling)
- Dust mask (plywood dust, sanding fines)
- Hearing protection (mitre saw, long auger drilling)

## Cut list

Stock: 10x 6m lengths of 45x90.

PlaceMakers (rough cut, every piece must fit Toyota Hiace at <= 2700mm):

For each stick, 2 cuts:
"First piece 2.5m, second piece 2.3m, leave the rest."
The remainder is the third piece (~1194mm after kerf). 20 cuts total.

Rough lengths give every piece a comfortable home-trim margin:
post 65mm, safety rail 70mm, short 104mm.

Allocation of the 30 rough pieces:

- 8 sticks: 2500 -> post-rough,       2300 -> safety-rail-rough, ~1194 -> short-rough
- 1 stick:  2500 -> bed-frame-rough,  2300 -> bed-frame-rough,   ~1194 -> short-rough
- 1 stick:  2500 -> rung-pair-rough,  2300 -> bed-frame-rough,   ~1194 -> short-rough

Total yield: 8 posts + 8 safety rails + 3 bed frames + 12 shorts (0 spare).

At home (accurate cut, square one end of each rough piece, then trim to final length):

- post-rough (2500mm) -> 1 post (2435mm), 65mm margin
- safety-rail-rough (2300mm) -> 1 safety rail (2230mm), 70mm margin
- bed-frame-rough (2300 or 2500mm) -> 1 bed frame (2050mm), 250 or 450mm margin
- short-rough (~1194mm) -> 1 short (1090mm), ~104mm margin
- rung-pair-rough (2500mm) -> 2 shorts (1090mm each); cut down the middle, then trim each

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

Every bolted joint uses 2 coach bolts on a diagonal across the 90x90
contact patch (M6 x 150mm except for the 4 dual-purpose side "b" top
rung / bed-frame joints, which use M10 x 200mm — see per-joint sections
below). Diagonal placement gives a moment arm in both axes (resisting
rotation in any direction in the joint plane) without needing the
redundancy of a 4-bolt square.

  Diagonal 2-bolt pattern (90x90 contact face, viewed from the bolt-head side):

       <----- 90mm ----->
      +------------------+   ^
      |                  |   |
      |    O             |   |
      |                  |  90mm
      |                  |   |
      |             O    |   |
      |                  |   |
      +------------------+   v

  - Bolt centres ~25mm from each adjacent edge (the square neck under
    the dome head needs wood on every side to bite into; closer than
    ~2x the bolt diameter risks splitting the edge — 25mm is ~4x for
    M6 and ~2.5x for M10, both safe).
  - Diagonal separation between centres ~57mm (sqrt(40^2 + 40^2)).
  - Either diagonal is fine (\ or /); flip whichever is convenient
    to mark out per joint — orientation does not change the strength.

- Drill clearance holes sized to the bolt: 7mm for M6, 11mm for M10
  (see Tools section). Drill each part separately, not through all
  layers at once with the parts clamped. The laminated post pair counts
  as one part — drill through both 45mm layers in one pass (90mm).
- For each joint: drill the post first, then use it as a physical
  template for the matching part(s). Clamp them in assembly position,
  poke a pencil through the post holes to mark the rung/support/rail
  behind, lift it off and drill to those marks.
- Coach bolt head sits on the outer face (square neck bites the wood
  when tapped firmly home with a mallet); flat washer + Nyloc nut on
  the inner face.
- Do NOT glue — bolts are what makes the structure disassemblable for transport.

Lower 5 ladder rungs to posts (side "b" only, 10 joints, 135mm of timber):

- 2x M6 x 150mm coach bolts per rung-end, diagonal pattern (above).
- Bolt traverses rung (45) + outer post (45) + inner post (45) = 135mm.
- We might want to put wood in the empty slots between rungs.

Side "a" bed frame to posts (2 joints, 135mm of timber):

- 2x M6 x 150mm coach bolts per joint, diagonal pattern (above) across
  the 90x90 contact area where the bed-frame support meets the post pair.
- Bolt traverses outer post (45) + inner post (45) + bed-frame support (45)
  = 135mm.

Side "b" bed frame + top rung to posts (2 joints, 180mm of timber):

- 2x M10 x 200mm coach bolts per joint, diagonal pattern (above). These
  bolts secure rung AND bed frame in one fastener — same bolt does both
  jobs, so the two attachment patterns don't clash.
- Bolt traverses rung (45) + outer post (45) + inner post (45) + bed-frame
  support (45) = 180mm.

Safety rails to posts (24 joints, 135mm of timber):

- 8 horizontal rails (front/back, 4 levels each) attach to 2 posts at their
  ends — 16 joints, bolts in the y direction (perpendicular to bed length).
- 4 side rails (3 on side "a" between levels, 1 on side "b" at the bottom
  level) attach to 2 posts at their ends — 8 joints, bolts in the x
  direction (along bed length).
- 2x M6 x 150mm coach bolts per joint, diagonal pattern (above).
- Bolt traverses rail (45) + outer post (45) + inner post (45) = 135mm.
- Coach bolt head on the outer face of the rail; nut + washer is accessible
  from inside the bed enclosure (between the post pair).

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
