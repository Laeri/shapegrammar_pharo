as yet unclassified
updatePositions
self findPoints do:[:aPoint|
	|aSGVector|
	aSGVector := aPoint userData at: #shapeGrammarPoint.
	aPoint relocate: (aSGVector x @ aSGVector y) * self boundingSize.
	].
