# Loft

A bunk-bed-style loft frame in 90 x 90 laminated pine posts, sized for a
~2030 x 1070 mattress on the upper deck, with an integrated 8-rung ladder on
side "b" and a 4-tier safety rail around the upper bed.

![Loft, isometric](./images/iso.png)

The design is modelled in OpenSCAD in [`loft.scad`](./loft.scad). The render
above and the per-sub-assembly renders below are produced by the `Justfile` at
the repo root — see [Rendering](#rendering) below. Rendered with **OpenSCAD
2021.01**.

Dimensions cited in the BOM and Assembly sections below mirror the constants
at the top of `loft.scad` (e.g. `post_height = 2435`, `ladder_rungs = 8`,
`bed_length = 2050`, `bed_width = 1090`). If you change one of these, update
both — the README is a sibling source of truth, not a derived artifact.

## Guides

- https://www.productsafety.gov.au/business/search-mandatory-standards/bunk-beds-mandatory-standard

## Bill of Materials

45x90 timber:

- 8x post boards (laminated in pairs into 4 finished 90x90 posts): `post_height` = 2435mm
- 8x ladder rungs: `bed_width` - 2x (90mm - 30mm `ladder_notch`) = 970mm
- 3x bed frame joists: `bed_length` = 2050mm
- 2x bed frame supports: `bed_width` = 1090mm
- 8x safety rails: `bed_length` + 4x 45mm = 2230mm
- 3x safety rail sides: `bed_width` = 1090mm
- Total 45x90 length: ~56.7m (need 10x 6m sticks = 60m of stock)

12mm plywood panels:

- 1x bed panel: `bed_width` x `bed_length` = 1090mm x 2050mm
  - Note, this could instead have a length of (2050mm + 4 * 90mm), with notches for the posts cut out.
  - Also Note, this should have holes in it for the bed mattress to breathe.
- 1x back support panel: (`bed_length` + 4x 45mm) x `support_height` = 2230mm x 600mm
- 1x side-a support panel: `bed_width` x `support_height` = 1090mm x 600mm

PVA wood glue (~500ml total — for the 4 post laminations and the 16 ladder rung
housings; the bolted joints below are NOT glued, so the loft disassembles for
transport with side "b" + ladder shipping as one tall sub-assembly):

- https://www.bunnings.co.nz/parfix-pva-wood-glue-250ml-250ml_p0830569 (need 2x)

Polyurethane interior varnish:

- https://www.resene.co.nz/homeown/painting-your-home/woodcare7.htm
  - Resene Aquaclear
- https://www.resene.co.nz/Colorwood.htm
  - Resene Colorwood: "Rock Salt"
    - OR... "Rising Tide"

Screws — two jobs, two lengths:

Post lamination (~32-40 needed for the 4 finished posts):

- "75mm 14g Type 17 bugle-head batten screw" (Titan 100-pack)
  - https://www.bunnings.co.nz/titan-14g-x-75mm-zinc-gold-timber-bugle-batten-screw-100-pack_p0579085
- 8-10 screws per laminated post in a staggered pattern, ~250-300mm apart along
  the 2435mm post. (The BOM "8x post boards" is raw stock — those 8 boards
  glue up in pairs into 4 finished 90x90 posts.)

Ladder rung clamping (~32 needed for 8 rungs, 2 per end):

- "100mm 14g Type 17 bugle-head batten screw" (Titan, or equivalent in the same
  bugle-head Type 17 family — same driver bit as the 75mm).
- 2 screws per rung end on a small diagonal across the 90 x 45 rung-end face,
  driven from the OUTER face of the laminated post pair through 60mm of post
  material (the post depth behind the 30mm housing) and 40mm into the rung end.
- The screws are CLAMPS during PVA cure, not the primary fastener. The structural
  load is carried by the housing shelf + glue. So the screws don't need to be
  monstrous — they just need to pull the rung tight against the housing.

Bolts — coach (carriage) bolts + flat washer + Nyloc nut, single size:

- Coach bolts are the local NZ equivalent to "furniture bolts": the square neck under
  the dome head locks into the wood so only the nut turns. Hex bolts also work but
  need a spanner on the head and a washer on the head side.
- M6 x 150mm zinc-plated for all bolted joints. Every joint is 135mm of timber
  (3 layers x 45mm: rail or bed-frame support + post pair) with ~15mm of bolt
  protruding for washer + nut. Pine SG8 bearing capacity gives ~4x safety factor
  on the worst-loaded joint (bed frame), and 25mm edge distance in the diagonal
  pattern works out to ~4x the bolt diameter — very generous.
- (Ladder rungs are NOT bolted — they sit in 30mm glued + screwed housings in
  the posts. See the Ladder section under Assembly.)

Bolt count (every bolted joint uses 2 coach bolts on a diagonal across
the 90x90 contact patch — see the ASCII diagram in the Assembly section):

- Side "a" bed frame to posts: 2 joints x 2 = 4x M6 x 150mm
- Side "b" bed frame to posts: 2 joints x 2 = 4x M6 x 150mm
- Safety rails to posts: 22 joints x 2 = 44x M6 x 150mm
  - 8 horizontal (front/back) rails x 2 ends = 16 joints
  - 3 side rails (all on side "a") x 2 ends = 6 joints
- Total: 52x M6 x 150mm coach bolts + 52x M6 flat washers + 52x M6 Nyloc nuts.

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

- 7mm bit for the 52 M6 coach bolt holes. Standard clearance for M6 coach: square
  neck (~7.4mm across flats) bites the wood when the bolt is tapped firmly home with
  a mallet. Deepest single hole is 90mm (through the laminated post pair), past the
  flute of a standard jobber-length 7mm twist bit (~70mm) — use an extra-long twist,
  a 7mm brad-point, or a 7mm auger for those holes.
- 10mm socket + ratchet for the M6 Nyloc nuts.
- If a bolt spins under nut torque, tap it in harder to re-seat the square neck, or
  grip the dome head with vise grips. (Or use hex bolts with a washer under the head
  — no neck-bite needed at all.)
- Marking gauge or combination square + sharp pencil for transferring matching hole
  positions between parts.

Cutting — ladder rung housings (side "b" posts only, after lamination):

- Circular saw with the depth-of-cut set to exactly 30mm. Test the depth on a
  scrap of 45x90 before touching the posts.
- ~25mm bench chisel + mallet for clearing the waste between saw kerfs.
- Combination square + sharp pencil for marking the 90mm-wide x 45mm-tall housing
  outline on the inner face of each post pair. 16 housings total (2 side "b"
  posts x 8 rungs).
- Optional: a guide block clamped to the post to register the saw at a consistent
  depth and angle across all 16 housings.

Drilling — ladder rung screws (after the housings are cut and the rungs are
dry-fitted):

- 5.5mm twist bit for the screw clearance hole through the post pair (60mm from
  the outer post face to the back of the housing).
- 4mm twist bit for the pilot hole into the rung end grain (~30mm deep). End
  grain splits easily — pilots are NOT optional here.
- Same driver bit as the 75mm batten screws (typically square drive #3).

Drilling — plywood breathing holes (bed panel only):

- 25mm Forstner bit.
  - https://www.bunnings.co.nz/irwin-1-25mm-forstner-bit_p0355141
  - Forstner bits leave clean, flat-bottomed holes
    in 12mm plywood. Spade and auger bits tear out the back face of
    plywood badly, even with a backer.
  - Alternative: 25mm hole saw + arbor (slower but tidy).
- Drill from the top face with a sacrificial scrap clamped under the
  panel to prevent blow-out on the underside.
- Layout: ~150mm grid. For the 1090 x 2050 panel that is ~7 columns (across
  the 1090mm width) x ~13 rows (along the 2050mm length) = ~90 holes. Joists
  run lengthwise, so each joist is a candidate to align with one full COLUMN
  of holes (not a row). At the suggested grid origin (~75mm from each edge),
  joists 2 and 3 align with 2 of the 7 columns; joist 1 falls between columns.
  Skipping those 2 columns drops you to ~65 useful holes.

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

## Assembly

### Posts (laminate two 45x90s into one 90x90)

![Single laminated post with ladder housings](./images/post.png)

- Apply PVA glue across both mating faces — glue is the primary fastener;
  screws are clamps during cure.
- Drive 75mm 14g Type 17 bugle-head batten screws in a staggered pattern,
  ~250-300mm apart along the 2435mm post (~8-10 screws per post).
  - Drill 5.5mm clearance holes through the first board only — threads
    bite the second board and pull the joint tight against the glue.
  - Drill a 4mm pilot for the end screws (within ~75mm of either end)
    to avoid splitting end grain.
  - Pre-drill anywhere you hit a knot.

### All bolted joints — common procedure

Every bolted joint uses 2 M6 x 150mm coach bolts on a diagonal across
the 90x90 contact patch. Diagonal placement gives a moment arm in both
axes (resisting rotation in any direction in the joint plane) without
needing the redundancy of a 4-bolt square.

Diagonal 2-bolt pattern (90x90 contact face, viewed from the bolt-head side):

```
     <----- 90mm ----->
    +------------------+   ^
    |                  |   |
    |    O             |   |
    |                  |  90mm
    |                  |   |
    |             O    |   |
    |                  |   |
    +------------------+   v
```

- Bolt centres ~25mm from each adjacent edge (the square neck under
  the dome head needs wood on every side to bite into; closer than
  ~2x the bolt diameter risks splitting the edge — 25mm is ~4x the
  M6 bolt diameter, plenty).
- Diagonal separation between centres ~57mm (sqrt(40^2 + 40^2),
  where 40 = 90 - 2 x 25mm edge distance).
- Either diagonal is fine (\ or /); flip whichever is convenient
  to mark out per joint — orientation does not change the strength.

- Drill 7mm clearance holes for the M6 coach bolts (see Tools section).
  Drill each part separately, not through all layers at once with the
  parts clamped. The laminated post pair counts as one part — drill
  through both 45mm layers in one pass (90mm).
- For each joint: drill the post first, then use it as a physical
  template for the matching part(s). Clamp them in assembly position,
  poke a pencil through the post holes to mark the support/rail
  behind, lift it off and drill to those marks.
- Coach bolt head sits on the outer face (square neck bites the wood
  when tapped firmly home with a mallet); flat washer + Nyloc nut on
  the inner face.
- Do NOT glue these bolted joints — bolts (not glue) keep the structure
  disassemblable for transport. The only glued joints are the post
  laminations and the ladder rung housings.

### Ladder (side "b" only — 8 rungs in 30mm housings, glued + screwed)

![Side "b" with ladder rungs](./images/side-b.png)

Each rung is 970mm long (= `bed_width` - 2 x (90mm - 30mm `ladder_notch`)). Each
rung end sits in a 30mm-deep housing in the laminated post pair: 90mm wide (full
post width in x) x 45mm tall (matches rung z-dimension) x 30mm deep (into y).
The BOTTOM of the housing acts as a shelf — the rung bears on it in pure
compression, so the joint carries the climbing load even before glue/screws come
into the picture.

**Cut the housings (after lamination, before any rungs go in):**

- Mark all 16 housing outlines on the inner face of the 2 side "b" post pairs.
  Each housing is 90mm wide x 45mm tall x 30mm deep. With the current values
  (`ladder_start=90`, `ladder_height=2085`, `ladder_rungs=8`, spacing=285mm),
  the bottom of each housing (the bearing-shelf z) measured from the foot of
  the post is:

  | Rung | Shelf z (mm) | Rung | Shelf z (mm) |
  | ---- | -----------: | ---- | -----------: |
  | 0 (top) | 2085 | 4 |  945 |
  | 1       | 1800 | 5 |  660 |
  | 2       | 1515 | 6 |  375 |
  | 3       | 1230 | 7 (bottom) |  90 |

  The top of each housing is the shelf z + 45mm. If you change `ladder_*` in
  the code, re-run the file and read the `echo ladder_top=` output — note the
  OpenSCAD variable `top` inside `ladder_rungs_iter` is the shelf z + 90mm
  (the cube is then translated down by `b45x90[1]`=90, so shelf = top - 90).
  The `top` name predates the housing rewrite; it's not the geometric top of
  the rung (which sits at shelf + 45).
- Set the circular saw to a 30mm depth-of-cut; confirm on scrap.
- Plunge a series of parallel kerfs across the 90mm width of each housing,
  within the 45mm tall window, spaced ~3-5mm apart. The kerfs leave a row of
  thin wood fingers.
- Knock the fingers out with a 25mm bench chisel + mallet, then pare the bottom
  of the housing flat. The bottom (lower z-face) is the bearing shelf — flat
  matters; the back wall (y-face) just needs to be reasonably close.
- Test-fit each rung end. It should slide in snug with no glue, with the rung's
  top face flush with the top of the housing.

**Glue + screw the rungs:**

- Apply PVA glue to the housing's back wall and both z-face shelves, and to the
  matching faces of the rung end. Squeeze-out is easy to wipe before it sets;
  hardened squeeze-out is a sander's chore.
- Slide each rung into its two housings (one in each post of side "b").
- Drive 2x 100mm 14g batten screws per rung end on a small diagonal across the
  90 x 45 rung-end face, from the outer face of the post pair. The screw
  travels 60mm through the post and 40mm into the rung end. Pre-drill 5.5mm
  clearance in the post and 4mm pilot in the rung end (~30mm deep).
- Screws are tightened in opposing diagonals to pull the rung evenly against
  the housing while the glue cures.
- Wipe squeeze-out, leave the assembly clamped/horizontal for 24 hours, and do
  not climb on the ladder until the PVA has fully cured.

Note: once glued, side "b" + ladder is one permanent sub-assembly. The rest of
the loft (side "a", bed frame, safety rails) still disassembles via the bolted
joints; side "b" ships as a single tall ladder-frame piece.

### Side "a" bed frame to posts (2 joints, 135mm of timber)

![Side "a", no ladder](./images/side-a.png)

- 2x M6 x 150mm coach bolts per joint, diagonal pattern (above) across
  the 90x90 contact area where the bed-frame support meets the post pair.
- Bolt traverses outer post (45) + inner post (45) + bed-frame support (45)
  = 135mm.

### Side "b" bed frame to posts (2 joints, 135mm of timber)

![Bed frame sub-assembly](./images/bed-frame.png)

- Identical to the side "a" joint above — 2x M6 x 150mm coach bolts per joint
  in the diagonal pattern, across the 90x90 contact area where the bed-frame
  support meets the post pair.
- Bolt traverses outer post (45) + inner post (45) + bed-frame support (45)
  = 135mm.
- The ladder rungs are at independent z-heights from the bed support (z=1625-1715).
  Rung 1 housing sits at z=1800-1845 (85mm above the support top) and rung 2
  housing at z=1515-1560 (65mm below the support bottom), so the bed-frame bolt
  holes and the rung housings don't interfere — but the clearance is closer than
  it looks, so place the bolts in the middle of the 90x90 contact patch rather
  than chasing the corners toward the rung 2 housing below.

### Safety rails to posts (22 joints, 135mm of timber)

![Safety rails — 4 tiers, with the top level skipping the side-"a" rail](./images/safety-rails.png)

- 8 horizontal rails (front/back, 4 levels each) attach to 2 posts at their
  ends — 16 joints, bolts in the y direction (perpendicular to bed length).
- 3 side rails (all on side "a", filling the vertical gaps between the
  front/back rail levels; the top level skips its side rail — see
  `if (!is_top)` in the `safety_rail` module) attach to 2 posts at their
  ends — 6 joints, bolts in the x direction (along bed length).
- 2x M6 x 150mm coach bolts per joint, diagonal pattern (above).
- Bolt traverses rail (45) + outer post (45) + inner post (45) = 135mm.
- Coach bolt head on the outer face of the rail; nut + washer is accessible
  from inside the bed enclosure (between the post pair).

## Reference views

Orthographic projections of the full assembly, for dimensional reference:

| Front | Side | Top |
| :---: | :---: | :---: |
| ![Front](./images/front.png) | ![Side](./images/side.png) | ![Top](./images/top.png) |

## Rendering

The `Justfile` at the repo root has recipes for re-rendering every image in
this README. From the repo root:

```sh
just loft-render-all        # re-render every PNG into loft/images/
just loft-render-iso        # re-render just the hero
just loft-render-post       # re-render the post sub-assembly
just --list                 # show all recipes
```

PNG outputs land in `loft/images/` and are committed via Git LFS (see
`.gitattributes`).
