undo-undo
undo
| pos |
shape points removeAll: addedPoints .
shape lines removeAll: addedLines.

shape lines addAll: removedLinesAfterActionDo.
shape points addAll: removedPoints .
shape points do:[:shapeP|
	(oldPositionsDict includes: shapeP) ifTrue:[
	pos := oldPositionsDict at: shapeP.
	].
	].

widget invalidate.