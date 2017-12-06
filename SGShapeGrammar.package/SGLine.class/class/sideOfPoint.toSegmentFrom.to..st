lineIntersection
sideOfPoint: testP toSegmentFrom: p1 to: p2
|toP segment|
toP := testP - p1.
segment := p2 - p1.
^ (segment crossProduct2D: toP) sign.
