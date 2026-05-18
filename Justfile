# Justfile — re-renders the screenshots referenced from loft/README.md.
#
# Per-project recipes are prefixed `loft-`, `bed-`, `workout-` etc. to avoid
# naming collisions as more subprojects grow Justfile recipes of their own.
# Right now only the loft has render recipes.

scad        := "loft/loft.scad"
loft_images := "loft/images"
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
                 loft-render-post

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

# Single laminated post (rotated horizontal so 8 ladder housings read clearly)
loft-render-post:
    @mkdir -p {{loft_images}}
    openscad -o {{loft_images}}/post.png \
        --imgsize={{size}} --colorscheme={{scheme}} \
        --projection=p --viewall --autocenter \
        -D 'view="post"' {{scad}}

# Remove all rendered PNGs. WARNING: these files are committed (via LFS).
# After running this, `git status` will show them as deleted — restore with
# `git restore loft/images/` or re-create with `just loft-render-all`.
# Scoped to *.png so a hand-authored asset in this dir would survive.
loft-clean-images:
    rm -f {{loft_images}}/*.png
