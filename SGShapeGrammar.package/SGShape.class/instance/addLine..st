adding
addLine: aLine
	self
		assert: [ self lines noneSatisfy: [ :existingLine | aLine samePointsAs: existingLine ] ]
		description: [ 'line must not exist' ].
	self lines add: aLine.
	self notifyLineAdded: aLine