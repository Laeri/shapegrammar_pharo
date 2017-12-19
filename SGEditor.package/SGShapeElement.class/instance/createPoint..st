instance creation
createPoint: aSGVector
	| aPoint |
	
	aPoint := self newPoint.
	aPoint relocate: (aSGVector x @ aSGVector y) * self boundingSize.
	aPoint userData at: #shapeGrammarPoint put: aSGVector.
	^ aPoint