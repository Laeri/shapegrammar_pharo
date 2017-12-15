testing
hasLeftTurnInPoint: aPoint ofEdge: anEdge in: sortedEdges
	| index toEdge fromPoint pointToTest direction |
	index := sortedEdges indexOf: anEdge.
	index = 1
		ifTrue: [ index := sortedEdges size ]
		ifFalse: [ index := index - 1 ].
	toEdge := sortedEdges at: index.
	anEdge from = aPoint
		ifTrue: [ fromPoint := anEdge to ]
		ifFalse: [ fromPoint := anEdge from ].
	toEdge from = aPoint
		ifTrue: [ pointToTest := toEdge to ]
		ifFalse: [ pointToTest := toEdge from ].
		
	direction := SGLine sideOfPoint: pointToTest toSegmentFrom: fromPoint   to: aPoint .
	^ direction = 1.