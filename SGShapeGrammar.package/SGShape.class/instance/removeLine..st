removing
removeLine: aLine
	self
		assert: [ self lines includes: aLine ]
		description: [ 'Line must exist' ].

	self lines remove: aLine.
	self notifyLineRemoved: aLine