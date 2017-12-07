undo-undo
do

shape points addAll: addedPoints.
shape lines addAll: addedLines.

removedPoints do: [ :removedPoint|
		removedLinesAfterActionDo addAll: (shape linesFromOrTo: removedPoint).
	].
removedLines do:[:removedLine|
	removedLinesAfterActionDo addIfNotPresent: removedLine.
	].

shape lines removeAll: removedLinesAfterActionDo .

shape points removeAll: removedPoints .

removedPoints do:[:remP|widget removeSelection: remP].

newPositionsDict keysAndValuesDo: [:point :newPos|
			oldPositionsDict at: point put: (point x@point y).
			point set: (newPositionsDict at: point).
	  ].

widget invalidate.