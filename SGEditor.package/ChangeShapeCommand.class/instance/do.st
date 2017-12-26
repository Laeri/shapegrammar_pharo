undo-undo
do
	shape addAllPoints: self addedPoints.
	shape addAllLines: self addedLines.
		shape removeAllLines: self removedLines.
	shape removeAllPoints: self removedPoints.


	newPositionsDict
		keysAndValuesDo: [ :point :newPos | 
			oldPositionsDict at: point put: point x @ point y.
			point set: (newPositionsDict at: point) ].
	"Transform labels"
	self oldLabels do:[:oldLabel|
		shape labels remove: oldLabel ifAbsent:[Transcript show: 'Tried to remove label which is not there';cr.]].
	shape labels addAll: (self addedLabels ).
	oldToNewLabels keysAndValuesDo: [ :oldLabel :newLabels| 
		newLabels do:[:newLabel|
				newLabel color: oldLabel color.
				(labelTransforms at: (newLabel class) )cull: newLabel .
			].
		]