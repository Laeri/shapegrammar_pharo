adding
addAlpha: aShapeWidget
alpha := aShapeWidget .
alphaColumn  addChild: aShapeWidget at: 1.
alpha constraintsDo: [ :c | 
			c horizontal matchParent.
			c vertical matchParent ].