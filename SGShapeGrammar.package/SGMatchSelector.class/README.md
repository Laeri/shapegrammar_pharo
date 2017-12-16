I represent a selector which selects the best SGShapeMatch from a collection.

My subclasses will implement different scoring heurstics which will score a SGShapeMatch based on certain criterias.
Then the best scored SGShapeMatch will be returned in order that a SGRule can apply the transformation on the
best subshape.