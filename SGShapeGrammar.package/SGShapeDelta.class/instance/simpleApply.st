as yet unclassified
simpleApply
shape points removeAll: removedVertices.
shape lines removeAll: removedLines .
shape points addAll: addedVertices .
shape lines addAll: addedLines .
movePointToDict keysAndValuesDo: [ :point : pos|
		point set: pos.
	 ].