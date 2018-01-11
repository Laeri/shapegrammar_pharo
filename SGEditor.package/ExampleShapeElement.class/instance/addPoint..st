adding
addPoint: aSGVector

	(self findPoints: aSGVector)
		ifNotEmpty: [ ^ self ].

	self addChild: (self createPoint: aSGVector)