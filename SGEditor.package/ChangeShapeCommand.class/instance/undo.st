undo-undo
undo
shape points removeAll: self addedPoints .
shape lines removeAll: self addedLines.

shape lines addAll: self removedLines.
shape points addAll: self removedPoints .
oldPositionsDict associationsDo: [ :assoc|
	assoc key set: assoc value.
	 ].

