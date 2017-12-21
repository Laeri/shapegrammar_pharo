as yet unclassified
onPointMoved: anAnnouncement
	|thePoints aPoint aSGVector|
	aSGVector := (anAnnouncement point).
	thePoints := self findPoints: aSGVector.
	aPoint := thePoints first.
	aPoint relocate: (aSGVector x @ aSGVector y)* self boundingSize .
	