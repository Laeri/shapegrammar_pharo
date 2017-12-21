dnd handlers
dragEvent: anEvent
	| dragPosition dragDelta aSGVector |
	
	dragPosition := anEvent currentTarget globalPointToParent: anEvent position.
	dragDelta := dragPosition - dragStartPosition.

	anEvent currentTarget relocate: (originalPosition + dragDelta).
	aSGVector := anEvent target userData at: #shapeGrammarPoint.
	aSGVector x: (originalPosition x + dragDelta x) / shapeElement boundingSize .
	aSGVector y: (originalPosition y + dragDelta y) / shapeElement boundingSize .
	anEvent consumed: true