transformation
apply

	| shapeDelta command |
	shapeDelta := self editor hasShapeMatch
		ifTrue: [ self editor grammar rules first shapeDeltaFrom: self editor shape withMatch: self editor shapeMatch ]
		ifFalse: [ self editor grammar rules first getDeltaOn: self editor shape ].
	
	command := ChangeShapeCommand fromShapeDelta: shapeDelta.
	command do.
	self editor removeShapeMatch.
	self editor updatePositions.
	"editor onRuleApplied ."