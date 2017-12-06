drawing
clearMorphic
	LineMorph allInstancesDo: [ :inst | inst delete ].
	CircleMorph allInstancesDo: [ :inst | inst delete ].