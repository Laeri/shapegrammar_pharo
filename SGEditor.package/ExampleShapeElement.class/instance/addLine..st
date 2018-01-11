adding
addLine: aSGLine
	| theFromPoints theToPoints aLineElement |
	
	(self findLines: aSGLine)
		ifNotEmpty: [ ^ self ].

	theFromPoints := self findPoints: aSGLine from.
	theToPoints := self findPoints: aSGLine to.

	theFromPoints
		ifEmpty: [ self addPoint: aSGLine from ].

	theToPoints 
		ifEmpty: [ self addPoint: aSGLine to ].

	aLineElement := self createLine: aSGLine.

	aLineElement fromAnchor: (BlElementCenterAnchor element: (self findPoints: aSGLine from) first).
	aLineElement toAnchor: (BlElementCenterAnchor element: (self findPoints: aSGLine to) first).
	
	self addChild: aLineElement