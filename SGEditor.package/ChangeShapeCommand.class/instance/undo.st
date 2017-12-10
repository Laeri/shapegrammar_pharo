undo-undo
undo
shape points removeAll: addedPoints .
shape lines removeAll: addedLines.

shape lines addAll: removedLinesAfterActionDo.
shape points addAll: removedPoints .
oldPositionsDict associationsDo: [ :assoc|
	assoc key set: assoc value.
	 ].

widget invalidate.