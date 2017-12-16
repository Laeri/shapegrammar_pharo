I am a representation of a subshape matching.

I result by finding a shape alpha in an other shape called base shape S.
All points in alpha are somehow transformed onto the matched points in S. All matchings from points in alpha
to points in base shape S are stored. In addition the transformation from alpha coordinates ---> base shape coordinates are stored too. This transformation is used to determine where new points will be or where points are moved (points from beta will be added to the base shape). In addition to all matched points, there is a line matching too from alpha ---> S.

I will be used for a transformation applied by SGRule, to determine which shape (the matched subshape) is transformed.