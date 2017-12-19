removing
removePoint: aSGVector
	self removeLinesFromOrTo: aSGVector.
	self
		assert: [ self points includes: aSGVector ]
		description: [ 'Point must exist' ].

	self points remove: aSGVector.
	self notifyPointRemoved: aSGVector