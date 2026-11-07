# Notes for Claude

- User is not a woodworker, happy to learn. Explain the why only when it changes what they do.
- Designs must be idiot-proof, realistic (hand power tools, no drill press), strong and well-engineered.
- Writing style, for READMEs and code comments alike: plain English, simple human language, short sentences. Easy to skim and understand at a glance. Tables and lists over paragraphs. Explain the why only when it changes what the user does. Don't let sub-agents convince you to over-explain.
- Prefer jigs, stops and datums over "measure carefully".
- User has a Prusa MK4S (250 x 210 bed). Loft jigs are printed saddles with two pockets that hold a Big Gator steel drill guide: plastic places the steel, steel guides the bit. Plastic alone can't guide a bit for many holes. The bars taper (about 22 top, 14 bottom) and the pockets taper to match, registering at the wall top. Bar sizes and hole offsets at the top of jigs.scad are ruler readings the user must do before printing.
- Loft: the ladder is built (rung bands in the README are as-built) and all timber is cut. Don't propose moving rungs or re-cutting.
- Loft bolt holes are level and centred, not diagonal, on purpose. The rail jig turns around to do the other end of a rail, which mirrors any diagonal, so the two ends would only match if the user flips the jig or the rail between ends. Keep patterns that look the same upside down.
- Loft rails as cut vary by a few mm, so rail holes are not jigged from the rail ends. One master per family (longest long rail by jig; side "b" support drilled through the post holes on the ladder) and every other part is copied from it. Only post holes come from jigs.
