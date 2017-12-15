undo-undo
do
	shape points addAll: addedPoints.
	shape lines addAll: addedLines.
	removedPoints
		do:
			[ :removedPoint | removedLinesAfterActionDo addAll: (shape linesFromOrTo: removedPoint) ].
	removedLines
		do: [ :removedLine | removedLinesAfterActionDo addIfNotPresent: removedLine ].
	removedLinesAfterActionDo
		do: [ :line | 
			shape lines
				remove: line
				ifAbsent: [ Transcript show: 'remove line which is already removed' ] ].
	shape points removeAll: removedPoints.
	removedPoints do: [ :remP | widget removeSelection: remP ].
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
		].
	widget invalidate