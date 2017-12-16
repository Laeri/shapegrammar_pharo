I am a heuristic to select SGShapeMatches.

I use a random approach but balance it out by collecting all different configurations of the same subshape together
(a subshape can turn up several times, because different coordinate systems can result in the same points being mapped, for example a triangle will have the same local coordinates regarding which points is chosen as origin and which ones are chosen to make up the axes of the new local coordinate system).
This should make the selection of all subshapes "more random" than the naive SGRandomSelector