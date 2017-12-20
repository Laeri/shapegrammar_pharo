mouse handlers
clickEvent: anEvent
	| command shapeDelta |
	
	anEvent consumed: true.

	shapeDelta := self editor hasShapeMatch
		ifTrue: [ self editor grammar rules first shapeDeltaFrom: self editor shape withMatch: self editor shapeMatch ]
		ifFalse: [ self editor grammar rules first getDeltaOn: self editor shape ].
	self editor removeShapeMatch.
	
	command := ChangeShapeCommand fromShapeDelta: shapeDelta.
	command do.

	"showShape commandBuffer add: command.
	showShape invalidate."
	