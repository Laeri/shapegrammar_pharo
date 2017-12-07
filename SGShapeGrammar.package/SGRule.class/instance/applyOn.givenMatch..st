hook
applyOn: shape givenMatch: matchUsed
	| shapeChangeDelta |
	shapeChangeDelta := self shapeDeltaFrom: shape withMatch: matchUsed.
	shapeChangeDelta simpleApply