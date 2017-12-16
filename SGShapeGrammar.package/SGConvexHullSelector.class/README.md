I am a heuristic to select SGShapeMatches.

I score SGShapeMatches based on the size of the subshapes convex hull.
Because the SGShape can have any geometry, it might not have an area. Therefore convex hull can be used to determine
how big the extent is of the geometry. Usually bigger convex hulls should be preferrred, due to generating more visible geometry (if the subshape is bigger, the transformation will create geometry in this bigger frame, instead of creating geometry on a very small frame which is not visible).