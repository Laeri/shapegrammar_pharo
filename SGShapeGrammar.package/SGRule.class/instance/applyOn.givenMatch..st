hook
applyOn: shape givenMatch: matchUsed
	| shapeChangeDelta |
	shapeChangeDelta := self shapeDeltaFrom: shape withMatch: matchUsed.
	"shapeChangeDelta simpleApply fix implementation in method simpleApply"
	(ChangeShapeCommand fromShapeDelta: shapeChangeDelta  inWidget: nil) do.
	 