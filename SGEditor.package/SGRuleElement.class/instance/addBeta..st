adding
addBeta: aShapeWidget
	beta := aShapeWidget .
	betaColumn addChild: aShapeWidget at: 1.
	beta constraintsDo: [ :c | 
		c horizontal matchParent.
		c vertical matchParent ]