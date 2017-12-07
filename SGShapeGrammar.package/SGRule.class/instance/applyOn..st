hook
applyOn: shape
	| matchUsed |
	matchUsed := self selectMatchUsedIn: shape.
	self applyOn: shape givenMatch: matchUsed