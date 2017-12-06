hook
applyOn: shape
	| matchUsed |
	matchUsed := self selectMatchUsedInShape: shape.
	self applyOn: shape givenMatch: matchUsed