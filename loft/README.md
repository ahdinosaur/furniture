# Loft

A loft bed in laminated pine. Four 90 x 90 posts, a bed deck about 1.8 m up
sized for a 2030 x 1070 mattress, an 8-rung ladder built into one end, and a
4-tier safety rail around the top. Everything except the posts and the ladder
is bolted, so it comes apart for moving.

![Loft, isometric](./images/iso.png)

## At a glance

| | |
| --- | --- |
| Timber | 90 x 45 pine, laminated in pairs for the posts |
| Footprint | 2230 x 1090 mm over the posts, 2275 x 1180 mm with the rails |
| Post height | 2435 mm |
| Bed deck top | 1805 mm (joist tops), mattress sits on 12 mm ply above |
| Mattress | 2030 x 1070 mm, 10 mm clearance each side |
| Ladder | 8 rungs on side "b", 240 mm gap between rungs |
| Safety rail | 4 tiers front and back, 3 side rails on side "a". Gaps 90 mm (70 above the lowest tier) |
| Bolts | 8x M8 (bed frame) + 44x M6 (rails), cup head, 2 per joint. Heads inside, nuts recessed outside |
| Interchangeable | every long rail fits every long rail slot, either end first, recesses facing out. Same for side rails and supports. No labels. |

**Build order**

1. [Laminate the posts](#1-laminate-the-posts)
2. [Cut the ladder housings](#2-cut-the-ladder-housings-side-b-posts-only) into the two side "b" posts
3. [Glue and screw the rungs](#3-glue-and-screw-the-rungs) to make the ladder
4. [Print the 3 drilling jigs](#4-print-the-jigs)
5. [Drill the posts](#5-drill-the-posts), all 52 holes
6. [Drill the rails and supports](#6-drill-the-rails-and-supports): one master each, copy the rest
7. [Bolt each side together flat](#7-bolt-the-two-sides-together-flat) on sawhorses
8. [Stand it up and fit the bed frame](#8-stand-it-up-and-fit-the-bed-frame)
9. [Fit the safety rails](#9-fit-the-safety-rails), bottom tier first
10. [Drop in the panels](#10-panels), then [finish](#11-finish)

**Words used in this guide**

- **Side "a"** is the end without the ladder. **Side "b"** is the ladder end.
- **Front** and **back** are the two long sides.
- **Long rails** are the 8 front and back safety rails. **Side rails** are the
  3 on side "a". **Supports** are the 2 bed frame beams bolted to the posts.
- Every height is measured **up from the foot of the post**. The foot is the
  datum for everything, so posts of slightly different lengths don't matter.
- Each post has four faces, named by where they point:
  - **outer end face**: points away from the bed along its length
  - **inner end face**: points at the bed along its length
  - **outer long face**: the front or back of the loft
  - **inner long face**: points at the other post of its pair, across the bed
    width. On side "b" this is where the ladder housings are cut.

## Standard

NZ has no mandatory bunk bed standard. Trading Standards recommends
AS/NZS 4220. The rules that shape this design:

- No fastener or small part may stick out more than 5 mm, above 600 mm from
  the floor.
- Fasteners must be flush, recessed or domed, with no snag points.
- No gap between 95 and 230 mm anywhere a head could go.
- Guard rails must take 500 N sideways and 750 N down.

Links:

- https://www.productsafety.govt.nz/for-consumers/keeping-kids-safe/bunk-beds
- https://www.productsafety.gov.au/business/search-mandatory-standards/bunk-beds-mandatory-standard

## Materials

### Timber, 90 x 45 pine

| Part | Qty | Length | Notes |
| --- | ---: | ---: | --- |
| Post boards | 8 | 2435 | glue up in pairs into 4 posts |
| Ladder rungs | 8 | 970 | 1090 minus 2 x 60 (post depth behind the housing) |
| Bed frame joists | 3 | 2045 | 5 mm short so they drop in. The rails set the post spacing, not the joists. If cut at 2050, trim 5 mm. |
| Supports | 2 | 1090 | a few mm out is fine. The side "b" one is drilled on the ladder, see [step 6](#6-drill-the-rails-and-supports) |
| Long rails | 8 | 2230 | a few mm out is fine. The longest becomes the master, see [step 6](#6-drill-the-rails-and-supports) |
| Side rails | 3 | 1090 | a few mm out is fine. Copied from the side "b" support |
| Shelf blocks | 4 | 90 | offcuts. Sit under each support end. |
| Height stick | 1 | 2500 | any straight offcut |
| **Total** | | **~60 m** | 11 x 6 m sticks |

### Plywood, 12 mm

| Panel | Size | Notes |
| --- | --- | --- |
| Bed panel | 2140 x 1090 | cut it **last**, to the real opening. 90 x 90 notch at each side "a" corner so it reaches the side rail and closes the gap behind the posts. Needs breathing holes. |
| Back support panel | 2230 x 600 | cosmetic |
| Side "a" support panel | 1090 x 600 | cosmetic |

### Glue and finish

- **PVA wood glue, ~500 ml.** Only the post laminations and the rung housings
  are glued. No bolted joint is glued.
  - https://www.bunnings.co.nz/parfix-pva-wood-glue-250ml-250ml_p0830569 (2x)
- **Resene Aquaclear** clear top coat:
  https://www.resene.co.nz/homeown/painting-your-home/woodcare7.htm
- **Optional tint** under the Aquaclear, Resene Colorwood "Rock Salt" or
  "Rising Tide": https://www.resene.co.nz/Colorwood.htm

### Screws

| Job | Screw | Qty | Why this size |
| --- | --- | ---: | --- |
| Post lamination | 75 mm 14g Type 17 bugle batten screw | 32 to 40 | clamps the glue joint. 8 to 10 per post. |
| Rung clamping | 100 mm 14g Type 17 bugle batten screw | 32 | 60 mm through the post, 40 mm into the rung end. 2 per rung end. |
| Shelf blocks | 100 mm 14g Type 17 bugle batten screw | 12 | 45 mm through the block, 55 mm into the post. 3 per block. |

- Titan 75 mm: https://www.bunnings.co.nz/titan-14g-x-75mm-zinc-gold-timber-bugle-batten-screw-100-pack_p0579085
- The lamination and rung screws are clamps while the glue cures. The glue and
  the housing shelves carry the load, not the screws.

### Bolts

**Shopping list**

| Item | Qty | Notes |
| --- | ---: | --- |
| M8 x 130 cup head bolt, zinc | 8 (buy 10) | bed frame supports |
| M6 x 130 cup head bolt, zinc | 44 (buy 50) | rails |
| M8 Nyloc nut | 8 | |
| M6 Nyloc nut | 44 | |
| M8 flat washer, max 20 mm across | 8 | must fit in the 25 mm recess |
| M6 flat washer, max 20 mm across | 44 | same |

- "Cup head" is the NZ term, also "coach bolt". The square neck under the
  dome bites the wood so only the nut turns.
- If 130 is not stocked, buy 150 and cut every bolt down to 130 on the bench
  before assembly. Thread a nut on first, hacksaw, file the end, spin the nut
  off to clean the thread.
- Bunnings M6 x 150: https://www.bunnings.co.nz/zenith-m6-x-150mm-zinc-plated-coach-head-bolt-and-nut_p0230936
- Bunnings M8 x 150: https://www.bunnings.co.nz/zenith-m8-x-150mm-zinc-plated-cup-head-bolt-and-nut_p0231853
- Mitre 10 sells Bremick packs of 50 in M6 and M8.

**Bolt length.** Rail plus post is 135 mm. A bolt is measured from under its
head, so the tip ends up at `bolt length - 135` past the far face. Washer,
nut and recess don't move the tip.

| Bolt | Tip | |
| --- | --- | --- |
| 130 | 5 mm inside the recess | nothing sticks out |
| 150 | 15 mm proud of the wood | not allowed on a bunk bed. Cut to 130. |

The 20 mm recess is what makes 130 work: 15 mm of thread past the recess
floor, about 10 mm of it used by washer and Nyloc.

Stack a real post pair on a real rail and measure before you buy. Bolt
length = stack minus 5.

**Which way round.** Heads go on the inside of the loft, nuts on the
outside. Every nut sits in a 25 mm recess, 20 mm deep, so nothing sticks out.

| Bolt | Head on | Nut in a recess in |
| --- | --- | --- |
| M6 rail bolts | the post, inner face | the rail, outer face |
| M8 support bolts | the support | the post, outer end face |

Nothing is ever cut into the ladder's inner face, where the rungs are.

**Hole sizes.** The part under the bolt head gets a snug hole so the square
neck bites. The part under the nut gets a loose hole so parts drilled
separately still line up. Never drill the head side loose: in an 8 mm hole an
M6 neck never touches wood and the head spins when you tighten.

| Bolt | Head side, snug | Nut side, loose |
| --- | --- | --- |
| M6 | post, 6.5 mm | rail, 8 mm |
| M8 | support, 8.5 mm | post, 10 mm |

**Why M8 for the bed frame, M6 for the rails.** The supports are the only
joints holding people up. Each support end rests on a shelf block screwed to
the post. The block carries the weight into the post through its 3 screws.
The two M8 bolts hold the support against the post and are the backup. On
their own they still carry the worst case, two adults bouncing at one end.
The rails see a small fraction of that, so M6 is plenty.

The M8 holes sit 25 mm from the post edges and the support ends. The code
wants 32 mm for M8. That is fine here because the bolts are not the main load
path.

**Bolt count**

| Joint | Joints | Bolts |
| --- | ---: | ---: |
| Supports to posts | 4 | 8x M8 |
| Long rails to posts (8 rails x 2 ends) | 16 | 32x M6 |
| Side rails to posts (3 rails x 2 ends) | 6 | 12x M6 |
| **Total** | **26** | **52** |

Ladder rungs are not bolted. They sit in glued and screwed housings.

## Tools

**Cutting**

- Mitre saw with a stop block, or circular saw with a speed square
- Jigsaw or circular saw with a fine blade, for the plywood
- Tape, pencil, combination square, sawhorses

**Drilling**

- Cordless drill
- Big Gator V-DrillGuide, metric. Hardened steel bars with guide holes. They
  sit in the printed jigs and guide every hole. Two of them, Carbatec NZ,
  about $59 each:
  - 3 to 9.5 mm (MDG1000NP) for the 6.5 and 8 holes:
    https://www.carbatec.co.nz/product/35590-big-gator-v-drill-guides
  - 10 to 14 mm (MDG2000NP) for the 10 hole:
    https://www.carbatec.co.nz/product/17558-big-gator-v-drill-guides-10-14mm
- 3D printer, for the three jigs. The biggest is 170 x 105 mm.
- Long drill bits. 6.5, 8.5 and 10 mm, 200 mm long (through a 90 mm post
  and into the part behind it). 8 mm, 150 mm long (22 mm guide plus 45 mm
  rail).
- 11 mm bit, any length, only for opening a tight nut-side hole
- 5.5 mm twist bit (screw clearance holes) and 4 mm twist bit (pilots)
- Driver bit for the batten screws, usually square drive #3, check the box
- 25 mm Forstner bit, for the nut recesses and the bed panel breathing holes:
  https://www.bunnings.co.nz/irwin-1-25mm-forstner-bit_p0355141
- 10 mm and 13 mm sockets, ratchet, and a short extension bar to reach into
  the recesses

**Ladder housings**

- Circular saw with depth stop, set to 30 mm
- 25 mm bench chisel and mallet
- Optional guide block clamped to the post for a consistent saw depth

**Assembly**

- Two sawhorses
- 4 to 6 quick clamps or sash clamps
- A straight board to clamp across the sawhorses as a stop for the post feet
- Hammer, for seating the bolt heads
- Spirit level
- Glue spreader, damp rag

**Finishing**

- Random orbital sander, 80 / 120 / 180 / 320 grit
- Resene No Loss Speed Brush, 125 mm:
  https://shop.resene.co.nz/key-accessories/speedbrushes

**Safety**: glasses, dust mask, hearing protection.

## Build

### 1. Laminate the posts

![Single laminated post, no cuts yet](./images/post-blank.png)

Glue two 90 x 45 boards face to face to make each 90 x 90 post. All four posts
are the same at this stage.

- Spread PVA on both mating faces. Glue is the fastener, screws are clamps.
- Drive 75 mm batten screws in a staggered line, 8 to 10 per post, flush
  with the surface.
  - Drill 5.5 mm clearance holes through the first board only.
  - Drill 4 mm pilots within 75 mm of either end and through knots.
- Clamp, wipe squeeze-out, leave 24 hours.

**Keep the screws out of the bolt paths.** Bolt holes are drilled later at
the heights in [Drill the posts](#5-drill-the-posts). Hitting a screw with a
long bit wrecks both.

- Below 1450 mm: anywhere, 250 to 300 mm apart.
- Above 1450 mm, on all four posts: **only at 1750, 1990, 2170 and 2350.**

**Side "b" posts also keep screws out of these bands.** The ladder housings
get cut here next. Heights from the foot of the post. Add 25 mm buffer either
side.

| Rung | Housing band | Rung | Housing band |
| --- | ---: | --- | ---: |
| 0 (top) | 2085 to 2130 | 4 | 945 to 990 |
| 1 | 1800 to 1845 | 5 | 660 to 705 |
| 2 | 1515 to 1560 | 6 | 375 to 420 |
| 3 | 1230 to 1275 | 7 (bottom) | 90 to 135 |

The lower number in each band is the shelf the rung sits on. The same table is
used to mark the housings in the next step.

### 2. Cut the ladder housings (side "b" posts only)

![Side "b" post with all 8 ladder housings](./images/post.png)

Each rung end sits in a housing 90 mm wide (the full post), 45 mm tall and
30 mm deep, cut into the **inner long face**. The bottom of the housing is a
shelf. The rung rests on it in compression, so the ladder carries climbing load
before glue or screws come into it.

- Mark all 16 housings (2 posts x 8 rungs) using the table above. Lower number
  is the shelf, upper edge is 45 mm above it.
- Set the saw to 30 mm depth. Test on scrap.
- Cut a row of kerfs 3 to 5 mm apart across each housing, chisel out the
  fingers, pare the shelf flat. The shelf matters, the back wall just needs to
  be close.
- Dry fit each rung. Snug, with the rung top flush with the housing top.

### 3. Glue and screw the rungs

![Side "b" with ladder rungs in their housings](./images/side-b.png)

- Glue the back wall and both shelves of each housing and the matching faces
  of the rung end.
- Slide each rung into its two housings.
- Drive 2x 100 mm batten screws per rung end, on a small diagonal across the
  90 x 45 rung end, from the **outer long face** of the post. Pre-drill 5.5 mm
  through the post and 4 mm about 30 mm into the rung end. End grain splits
  without a pilot.
- Tighten opposing diagonals so the rung pulls evenly into the housing.
- **Drive every rung screw flush or slightly below the surface.** They show
  on the outside of the bed.
- Scrape squeeze-out off the rung 2 ends where they show on the inner end
  face. A shelf block sits over them later.
- Wipe up, leave flat for 24 hours. No climbing until fully cured.

Side "b" plus the ladder is now one permanent piece. Everything else bolts on
and comes off again.

### 4. Print the jigs

**The rule: nothing is measured.** Post holes come from a jig that sits on
the post. Rail holes come from one master rail, copied onto the rest. Parts
made from the same master fit each other, so any rail fits any rail slot and
the loft goes back together after a move without labels.

A jig is a 3D printed saddle that drops over a post or a rail and centres
itself. On top are two pockets, 40 mm apart. A Big Gator steel guide (the
bar) sits in a pocket, flat on the wood. Drill through it, lift the bar into
the other pocket, drill again. The plastic places the bar. The steel guides
the bit, so nothing wears.

![The three jigs, a bar in one pocket of each. POST jigs have a line down the cheeks, the RAIL jig has an end stop](./images/jigs.png)

Three jigs. Two pockets each, 40 mm apart. One bar moves between them.

| Jig | Bar | Bit | Hole position | Registers on | Used on |
| --- | --- | --- | --- | --- | --- |
| **POST M6** | MDG1000NP | 6.5 mm | 25 and 65 across the post, both at the same height | a pencil line on the post | all 44 rail holes in the posts |
| **POST M8** | MDG2000NP | 10 mm | 25 and 65 across the post, both at the same height | a pencil line on the post | the 8 support holes in the posts |
| **RAIL** | MDG1000NP | 8 mm | 25 and 65 from the end stop, both dead centre (45 up) | the end of the rail | both ends of the master long rail only |

Every pattern is symmetric, so no jig has a right way round, and every part
fits either end first.

Why both holes at the same height and not on a diagonal: a drop-on jig makes
the mirror image at the other end of a rail. With a diagonal, the two ends
only match if you flip the rail over between them, and one forgotten flip
scraps a rail. Level, centred holes come out the same every time. The extra
twist strength of a diagonal is not needed, the plywood panels and the deck
stiffen the frame.

| POST jig on a post | RAIL jig on a rail end |
| :---: | :---: |
| ![POST M6 jig sitting on a post, cheek line on the pencil line, bar in one pocket](./images/jig-on-post.png) | ![RAIL jig on a rail end, end stop against the end, bar across the rail](./images/jig-on-rail.png) |

Left: the line on the cheeks sits on the pencil line around the post, the
bar lies along the post. Right: the end stop butts against the rail end, the
bar lies across the rail and hangs over one edge. That is fine, the pocket
holds it flat.

**Before printing: three ruler readings.** A pocket holds the bar by its
outside, so the print has to know where the hole is along the bar. Lay each
bar on a ruler, the end with the smallest hole at zero, and read the centre
of the hole. Type the numbers into the top of [`jigs.scad`](./jigs.scad).

| Reading | Bar | Set this |
| --- | --- | --- |
| End to centre of the 6.5 hole | MDG1000NP | `hole_6_5_from_end` |
| End to centre of the 8 hole | MDG1000NP | `hole_8_from_end` |
| End to centre of the 10 hole | MDG2000NP | `hole_10_from_end` |

Check the bar lengths and widths against `bar_small` and `bar_large` while
the ruler is out. Nearest millimetre is plenty. A millimetre out moves every
post hole the same way, so the rails stay level and the posts still match. On
the rail it only moves where the master's ends sit against the post face.

**Print.** `just loft-stl-all` writes the three STLs to [`stl/`](./stl/),
already flat side down. PLA or PETG, 4 walls, 30% infill, no supports.

**Using a jig.**

1. Drop it over the part. POST: line on the cheeks on the pencil line. RAIL:
   end stop against the rail end.
2. Bar in a pocket, small-hole end toward the arrow. Push it to that end.
3. Drill through the guide hole. Lift the bit out often to clear the chips.
4. Move the bar to the other pocket. Repeat.

Tight on the wood? Raise `part_clear` in `jigs.scad` and print again. A depth
collar for the 25 mm Forstner bit is also worth printing.

### 5. Drill the posts

Posts flat on sawhorses. The ladder can already be glued: the jig only ever
sits on faces with no rungs, and nothing is cut into the rung face.

**Height stick.** A straight 2.5 m offcut. Mark every height in the table
below from one end. Use it for all four posts, end against the foot. Also
mark 1625 on it: the bottom of the support. No hole goes there, but side "b"
needs that line in step 6.

| What bolts here | Jig on this face | Height | Jig | Side "b" |
| --- | --- | ---: | --- | --- |
| Support | outer end face | 1670 | POST M8 | yes |
| Long rail tier 3 (lowest) | inner long face | 1870 | POST M6 | yes |
| Side rail, lowest | inner end face | 1940 | POST M6 | side "a" only |
| Long rail tier 2 | inner long face | 2030 | POST M6 | yes |
| Side rail, middle | inner end face | 2120 | POST M6 | side "a" only |
| Long rail tier 1 | inner long face | 2210 | POST M6 | yes |
| Side rail, top | inner end face | 2300 | POST M6 | side "a" only |
| Long rail tier 0 (top) | inner long face | 2390 | POST M6 | yes |

Side "a" posts get 16 holes each, side "b" posts 10 each. 52 total. Each
height is the middle of its rail. Long rail and side rail bolts are at least
50 mm apart in height, so no bolts cross inside a post.

Why tier 3 is at 1825 to 1915, not 1805: its bolt must clear rung 1, which
tops out at 1845, and the rung screws in that band. At 1870 it clears by 20.
The gap above tier 3 is 70 mm, the other gaps are 90.

**Rail holes, 44.** Carry the height line from the stick around the post with
a square. Jig on the inner face, cheek line on the pencil line. Drill both
holes right through. The bolt head goes on this face, the rail covers the
other side.

**Support holes, 8.** Same, but the jig goes on the outer end face and the
nut recess goes in first. On side "b", also carry the 1625 line right around
both posts:

1. Jig and bar on. Spin the bit by hand in the guide to dimple the wood.
   Same in the other pocket. Jig off.
2. Forstner a 25 mm recess, **20 mm deep**, on each dimple. Tape or a collar
   on the bit for depth.
3. Jig back on. Drill both holes right through.

**Side "b" is a ladder, not a loose post.** Lay it flat on the sawhorses. The
jig can't sit on the rung face, so for the long rail holes it goes on the
**outer** long face instead, clamped. Drill until the bit tip just shows on
the inner face, then finish the last bit from the inner face with the same
bit. That keeps the mouth clean where the bolt head sits. The support holes
go in the outer end faces as normal.

### 6. Drill the rails and supports

Rails cut by hand come out a few mm long or short. That is fine. A post does
not care where a rail ends, only that the two hole pairs are the right
distance apart. So each family gets **one master**, and every other part is
**copied from it**.

| Family | Master | Copies |
| --- | --- | --- |
| Supports (2) | side "b" support, drilled on the ladder | side "a" support |
| Side rails (3) | side "b" support again | all 3 |
| Long rails (8) | the longest long rail, drilled with the RAIL jig | the other 7 |

Lay every part flat and leave it that way until it is drilled. **The face
that is up becomes the outside.**

**Side "b" support, drilled on the ladder.** Its holes must match the ladder
as built, so they are drilled through the post holes.

1. Ladder flat on the sawhorses, **outer end faces up**, sawhorses under the
   lower half of the posts.
2. Clamp the support under the posts, against the inner end faces. Bottom
   edge on the 1625 lines, ends roughly even.
3. Drill down through each of the 4 post holes with the 8.5 mm bit, right
   through the support. The post hole guides the bit.

No recesses: the support bolt heads sit on the support, the nuts go in the
post.

**Side "a" support.** Clamp support "b" on top of it, long edges flush, the
same overhang at both ends. Drill straight through all 4 holes with the
8.5 mm bit.

**Master long rail.** Pick the longest. The nuts sit in recesses in the rail,
so the recesses go in first.

1. Push the RAIL jig onto one end, end stop tight against the end. Spin the
   bit by hand in the guide to dimple the wood, one pocket then the other.
   Turn the jig around, dimple the other end. Jig off.
2. Forstner a 25 mm recess, **20 mm deep**, on each of the 4 dimples.
3. Jig back on, each end in turn. Drill the 4 holes right through.

![A finished rail end: two holes, two recesses, one with its washer and nut](./images/rail-end.png)

**Copies: 7 long rails and 3 side rails.** The template is the master long
rail for long rails, support "b" for side rails.

1. Blank flat, template on top, recesses up. Long edges flush. Same overhang
   at both ends, by eye. Clamp.
2. Spin the 8 mm bit by hand in each template hole to dimple the blank.
   Template off.
3. Forstner a 25 mm recess, **20 mm deep**, on each dimple.
4. Drill the 4 holes right through with the 8 mm bit.

![The master long rail clamped on a blank, bit dimpling through one hole](./images/rail-copy.png)

Why the longest long rail is the master: every copy then ends a little inside
the post face instead of sticking out past it.

Every hole is dead centre, 45 up. Both ends of every part match. A rail has
one rule: recesses face out.

**Check.** Push a bolt through a rail hole and a post hole. It should slide in
with a little wiggle, no forcing. If one fights, open the **nut side** hole
with the next size up: the rail hole to 8.5 mm for M6, the post hole to 11 mm
for M8. Never open the head side hole.

### 7. Bolt the two sides together flat

Assemble each end of the loft lying across two sawhorses. Put the sawhorses
under the lower half of the posts so you can reach under the holes. Heads
inside, nuts in the recesses outside.

**Fitting a bolt.** Push it through from the head side. Washer and Nyloc on
finger tight. Tap the dome with a hammer until it sits tight on the wood, so
the square neck bites. Then tighten.

**Side "a"**

1. Clamp a straight board across the sawhorses as a stop. Both post feet
   press against it, so both posts share the same datum.
2. Lay the two posts on the sawhorses, **outer end face up**, feet on the
   stop, about 1090 apart. The holes set the exact width.
3. Lay the 3 side rails on top at 1895, 2075 and 2255, recesses up, holes
   over the post holes. Push the 12 bolts up from underneath. Washer and
   Nyloc in the recesses on top, then tap the heads home from below.
4. Check the diagonals of the rectangle are equal, then tighten.
5. Flip the frame, **inner end face up**. Lay the support across at 1625 to
   1715, holes over the post holes. Fit the 4 M8 bolts from the top. The nuts go in the recesses on the outer end face,
   underneath.
6. Lay a shelf block on each post on the foot side of the support, butted
   tight against it. Drill 5.5 mm through the block, then screw it to the
   post with 3x 100 mm batten screws **in the 40 mm nearest the support**.

**Side "b"**

1. Lay the ladder across the sawhorses, **inner end faces up**. Repeat steps
   5 and 6.

### 8. Stand it up and fit the bed frame

![Bed frame, joists in yellow, supports in cyan](./images/bed-frame.png)

- Stand both sides up, about 2230 apart over the posts. Clamp a long offcut across
  the front of both end frames at about 1 m up as a temporary rail, so they
  stand on their own.
- Fit the two tier 3 long rails, front and back, as in the next step. They set
  the distance between the ends. Take the temporary rail off.
- Drop the 3 joists onto the two supports, between the posts: one against
  each side touching the posts, one in the middle. Joist tops are at 1805,
  level with the bottom of the tier 3 rails.
- Plumb the posts. Measure the two diagonals of the front face. Equal means
  square.

### 9. Fit the safety rails

![Safety rails, 4 tiers, no side rail on top](./images/safety-rails.png)

Work from the bottom tier up. Each rail adds rigidity and the low ones are
easier to reach. Any long rail fits any tier, either end first. Recesses face
out.

For each rail:

1. From inside, push the 4 bolts through the post holes. They stick out of
   the outer face like pegs.
2. From outside, hang the rail on the pegs, **recesses facing you**. Check
   that before the next step.
3. Washer and Nyloc on finger tight. Tap the heads home from inside. Tighten
   with the socket and extension.

If a nut won't reach the thread, the rail is on recess side in. Turn it over.

### 10. Panels

**Bed panel.** Cut it now, to the real joist length and real post spacing,
plus 90 mm at the side "a" end with a 90 x 90 notch at each corner. The extra
90 covers the gap between the posts behind the side rails. Drill the breathing
holes on a bench before fitting:

- 25 mm Forstner, about a 150 mm grid, 75 mm in from the edges. That is about
  7 columns across by 13 rows along, around 90 holes.
- The joists run lengthwise, so two of the columns land on joists. Skip those,
  leaving about 65 useful holes.
- Clamp scrap under the panel to stop blow-out.
- Drops onto the joists. Gravity and the supports hold it. No fasteners.

**Support panels.** Back panel on the back posts, side "a" panel on the side
"a" posts, top edge at 800 mm. A few short countersunk screws into the posts.
Cosmetic only, don't load them.

### 11. Finish

Sand and finish before the frame goes together if you can. Reaching into the
assembled bed with a sander is awkward.

- Sand 80, 120, 180.
- Optional Colorwood tint, dry per the tin.
- 2 to 3 coats of Aquaclear with the 125 mm Speed Brush, light 320 sand
  between coats.

### After it's built

- **Re-tighten all 52 nuts after 2 to 4 weeks**, and again each year. Timber
  shrinks under the washers.
- **To move it**: take off the rails, lift out the panel and joists, unbolt
  the two supports. Side "b" travels as one tall ladder piece. Any rail goes
  back in any slot, recesses out. The shelf blocks stay on the posts.

## Reference views

| Front | Side | Top |
| :---: | :---: | :---: |
| ![Front](./images/front.png) | ![Side](./images/side.png) | ![Top](./images/top.png) |

## Design source

The model is in [`loft.scad`](./loft.scad), rendered with OpenSCAD 2021.01.
Axes: x runs along the bed length, y across the bed width, z up. The jigs
are in [`jigs.scad`](./jigs.scad), with printable STLs in [`stl/`](./stl/).

The numbers in this README mirror the constants at the top of the file
(`post_height = 2435`, `ladder_rungs = 8`, `ladder_start = 90`,
`bed_height = 1715`, `rail_tier3_lift = 20`,
`bed_length = 2050`, `bed_width = 1090`, and so on). If you change one, update
both. The README is a sibling source of truth, not generated. The housing
shelf heights come from the `echo ladder_top=` output (shelf = `top` minus 90,
a leftover name from before the housing rewrite). Bolts, recesses, shelf
blocks and the bed panel notches are not in the model.

## Rendering

```sh
just loft-render-all         # re-render every PNG into loft/images/
just loft-render-iso         # re-render just the hero
just loft-render-post-blank  # re-render the bare laminated post (no housings)
just loft-render-post        # re-render the post sub-assembly (with housings)
just loft-render-jigs        # re-render the three jigs (also jig-on-post, jig-on-rail, rail-end, rail-copy)
just loft-stl-all            # export the three printable jigs into loft/stl/
just --list                  # show all recipes
```

PNGs land in `loft/images/`, STLs in `loft/stl/`. Both are committed via Git
LFS (see `.gitattributes`).
