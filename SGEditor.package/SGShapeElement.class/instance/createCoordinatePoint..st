instance creation
createCoordinatePoint: aSGVector
	| aPoint |
	
	aPoint := self newPoint.
	aPoint relocate: (aSGVector x @ aSGVector y) * self boundingSize.
	aPoint userData at: #shapeGrammarCoordinatePoint put: aSGVector.
	aPoint background: BlBackground transparent.

	^ aPoint