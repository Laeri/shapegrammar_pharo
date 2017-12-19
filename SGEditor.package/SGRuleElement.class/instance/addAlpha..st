adding
addAlpha: aShapeElement
	alpha := aShapeElement .
	alphaColumn addChild: aShapeElement at: 1.
	alpha constraintsDo: [ :c | 
		c horizontal matchParent.
		c vertical matchParent ]