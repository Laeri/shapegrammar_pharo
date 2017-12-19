removing
removeLinesFromOrTo: aSGVector
	| linesToRemove |
	
	linesToRemove := self linesFromOrTo: aSGVector.
	linesToRemove
		ifEmpty: [ ^ self ].

	self
		assert: [ self lines includesAll: linesToRemove ]
		description: [ 'All lines must exist' ].
	
	self lines removeAll: linesToRemove.
	linesToRemove do: [ :aLine | self notifyLineRemoved: aLine ]