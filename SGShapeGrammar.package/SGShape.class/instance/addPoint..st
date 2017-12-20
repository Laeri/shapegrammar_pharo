adding
addPoint: aPoint
	self
		assert: [ (self points includes: aPoint) not ]
		description: [ 'Point must not exist' ].
	self assert: [ (self points noneSatisfy: [ :aPointInShape | aPointInShape closeTo: aPoint precision: SGMatchSelector equalityRange]) ].

	self points add: aPoint.
	self notifyPointAdded: aPoint