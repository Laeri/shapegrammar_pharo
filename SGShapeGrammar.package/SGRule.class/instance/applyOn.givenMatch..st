hook
applyOn: shape givenMatch: matchUsed
	| shapeChangeDelta |
	shapeChangeDelta := self shapeDeltaFromShape: shape GivenMatch: matchUsed.
	shapeChangeDelta simpleApply