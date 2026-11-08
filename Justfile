# Justfile — re-renders the screenshots referenced from loft/README.md and
# exports the printable jigs.
#
# Per-project recipes are prefixed `loft-`, `bed-`, `workout-` etc. to avoid
# naming collisions as more subprojects grow Justfile recipes of their own.
# Right now only the loft has render recipes.

scad        := "loft/loft.scad"
jigs_scad   := "loft/jigs.scad"
loft_images := "loft/images"
loft_stl    := "loft/stl"
size        := "1600,1200"
scheme      := "Cornfield"

# Show available recipes
default:
    @just --list

# Re-render every image referenced in loft/README.md
loft-render-all: loft-render-iso \
                 loft-render-front \
                 loft-render-side \
                 loft-render-top \
                 loft-render-side-a \
                 loft-render-side-b \
                 loft-render-bed-frame \
                 loft-render-safety-rails \
                 loft-render-post-blank \
                 loft-render-post \
                 loft-render-bed-panel \
                 loft-render-jigs \
                 loft-render-jig-on-post \
                 loft-render-jig-on-rail \
                 loft-render-rail-end \
                 loft-render-rail-copy

# --- full assembly ---

# Hero shot — perspective isometric, auto-framed
loft-render-iso:
    @mkdir -p {{loft_images}}
    openscad -o {{loft_images}}/iso.png \
        --imgsize={{size}} --colorscheme={{scheme}} \
        --projection=p --viewall --autocenter \
        -D 'view="all"' {{scad}}

# Orthographic front (long face) — shows bed length and safety rails
loft-render-front:
    @mkdir -p {{loft_images}}
    openscad -o {{loft_images}}/front.png \
        --imgsize={{size}} --colorscheme={{scheme}} \
        --projection=o --camera=985,500,1217,90,0,0,8000 \
        -D 'view="all"' {{scad}}

# Orthographic side (short face — ladder side) — shows post heights and ladder
loft-render-side:
    @mkdir -p {{loft_images}}
    openscad -o {{loft_images}}/side.png \
        --imgsize={{size}} --colorscheme={{scheme}} \
        --projection=o --camera=985,500,1217,90,0,90,8000 \
        -D 'view="all"' {{scad}}

# Orthographic top (looking down -z) — shows bed and rail footprint
loft-render-top:
    @mkdir -p {{loft_images}}
    openscad -o {{loft_images}}/top.png \
        --imgsize={{size}} --colorscheme={{scheme}} \
        --projection=o --camera=985,500,1217,0,0,0,8000 \
        -D 'view="all"' {{scad}}

# --- sub-assemblies ---

# Side "a" alone: 2 posts (no ladder — paired with side-b for symmetry)
loft-render-side-a:
    @mkdir -p {{loft_images}}
    openscad -o {{loft_images}}/side-a.png \
        --imgsize={{size}} --colorscheme={{scheme}} \
        --projection=p --viewall --autocenter \
        -D 'view="side_a"' {{scad}}

# Side "b" alone: 2 posts + 8 ladder rungs (the permanent ladder sub-assembly)
loft-render-side-b:
    @mkdir -p {{loft_images}}
    openscad -o {{loft_images}}/side-b.png \
        --imgsize={{size}} --colorscheme={{scheme}} \
        --projection=p --viewall --autocenter \
        -D 'view="side_b"' {{scad}}

# Bed frame structure (joists + support sides; bed panel hidden so joists read)
loft-render-bed-frame:
    @mkdir -p {{loft_images}}
    openscad -o {{loft_images}}/bed-frame.png \
        --imgsize={{size}} --colorscheme={{scheme}} \
        --projection=p --viewall --autocenter \
        -D 'view="bed_frame"' {{scad}}

# All 4 tiers of safety rails (floats in space without posts — paired with iso for context)
loft-render-safety-rails:
    @mkdir -p {{loft_images}}
    openscad -o {{loft_images}}/safety-rails.png \
        --imgsize={{size}} --colorscheme={{scheme}} \
        --projection=p --viewall --autocenter \
        -D 'view="safety_rails"' {{scad}}

# Single laminated post, no housings (the lamination output before any cuts)
loft-render-post-blank:
    @mkdir -p {{loft_images}}
    openscad -o {{loft_images}}/post-blank.png \
        --imgsize={{size}} --colorscheme={{scheme}} \
        --projection=p --viewall --autocenter \
        -D 'view="post_blank"' {{scad}}

# Single laminated post (rotated horizontal so 8 ladder housings read clearly)
loft-render-post:
    @mkdir -p {{loft_images}}
    openscad -o {{loft_images}}/post.png \
        --imgsize={{size}} --colorscheme={{scheme}} \
        --projection=p --viewall --autocenter \
        -D 'view="post"' {{scad}}

# The bed panel alone, from above: notched end and breathing holes.
# Full render, not preview, so the thin notches draw cleanly.
loft-render-bed-panel:
    @mkdir -p {{loft_images}}
    openscad -o {{loft_images}}/bed-panel.png \
        --imgsize={{size}} --colorscheme={{scheme}} \
        --projection=o --camera=0,0,0,0,0,0,0 --viewall --autocenter --render \
        -D 'view="bed_panel"' {{scad}}

# --- drilling jigs (loft/jigs.scad) ---

# All three printed jigs side by side, a guide bar in one pocket of each
loft-render-jigs:
    @mkdir -p {{loft_images}}
    openscad -o {{loft_images}}/jigs.png \
        --imgsize={{size}} --colorscheme={{scheme}} \
        --projection=p --viewall --autocenter \
        -D 'view="all"' {{jigs_scad}}

# POST M6 jig on a post, index line on the pencil line, bar in one pocket
loft-render-jig-on-post:
    @mkdir -p {{loft_images}}
    openscad -o {{loft_images}}/jig-on-post.png \
        --imgsize={{size}} --colorscheme={{scheme}} \
        --projection=p --viewall --autocenter \
        -D 'view="on_post"' {{jigs_scad}}

# RAIL jig on the end of a rail, end stop against the end, bar across the rail
loft-render-jig-on-rail:
    @mkdir -p {{loft_images}}
    openscad -o {{loft_images}}/jig-on-rail.png \
        --imgsize={{size}} --colorscheme={{scheme}} \
        --projection=p --viewall --autocenter \
        -D 'view="on_rail"' {{jigs_scad}}

# A finished rail end: two holes with their nut recesses, bolt in one
loft-render-rail-end:
    @mkdir -p {{loft_images}}
    openscad -o {{loft_images}}/rail-end.png \
        --imgsize={{size}} --colorscheme={{scheme}} \
        --projection=p --camera=130,45,22,35,0,20,480 \
        -D 'view="rail_end"' {{jigs_scad}}

# The master rail clamped on a blank, bit dimpling through one hole
loft-render-rail-copy:
    @mkdir -p {{loft_images}}
    openscad -o {{loft_images}}/rail-copy.png \
        --imgsize={{size}} --colorscheme={{scheme}} \
        --projection=p --camera=190,45,45,40,0,25,1150 \
        -D 'view="copy"' {{jigs_scad}}

# --- printable jigs (STL, flat side down, ready to slice) ---

# Export all three jigs
loft-stl-all: loft-stl-post-m6 loft-stl-post-m8 loft-stl-rail

loft-stl-post-m6:
    @mkdir -p {{loft_stl}}
    openscad -o {{loft_stl}}/post-m6.stl -D 'view="post_m6"' -D 'print=true' {{jigs_scad}}

loft-stl-post-m8:
    @mkdir -p {{loft_stl}}
    openscad -o {{loft_stl}}/post-m8.stl -D 'view="post_m8"' -D 'print=true' {{jigs_scad}}

loft-stl-rail:
    @mkdir -p {{loft_stl}}
    openscad -o {{loft_stl}}/rail.stl -D 'view="rail"' -D 'print=true' {{jigs_scad}}

# Remove all rendered PNGs. WARNING: these files are committed (via LFS).
# After running this, `git status` will show them as deleted — restore with
# `git restore loft/images/` or re-create with `just loft-render-all`.
# Scoped to *.png so a hand-authored asset in this dir would survive.
loft-clean-images:
    rm -f {{loft_images}}/*.png
