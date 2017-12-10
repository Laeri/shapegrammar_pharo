hook
applyOn: shape givenMatch: matchUsed
	| shapeChangeDelta |
	self halt.
	shapeChangeDelta := self shapeDeltaFrom: shape withMatch: matchUsed.
	shapeChangeDelta simpleApply