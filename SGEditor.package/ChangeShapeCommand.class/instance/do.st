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
	shape labels removeAll: (self oldLabels).
	shape labels addAll: (self addedLabels ).
	shape labels do: [ :label | (labelTransforms at: label class) cull: label ].
	widget invalidate