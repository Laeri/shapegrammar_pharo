I am a 3x3 matrix used to work with homogeneous coordinates.

I can be used to either transform a SGVector or transform it without overwriting its actual values
but storing the tranformed coordinates in temporary variables inside SGVector.
This is used in order to calculate the transformations of the SGVector without overwriting it and without
needing to create temporary objects to hold those values.