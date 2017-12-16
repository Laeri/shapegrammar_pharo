I am a heuristic to select SGShapeMatches.

I score a subshape match based on how "old" the points are which have been found to make up a subshape.
The age can be based on either age of creation, when the point was added to the SGShape.
This age defines in which rule application step, the point was added.
Or the age can also be used to define the time passed since it was last found to be in a subshape.