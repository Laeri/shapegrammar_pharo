as yet unclassified
findPolygonFrom: aPoint withFirstEdge: firstEdge inSortedEdges: sortedEdges
	| start polygonPoints sortedEdgesOfPoint currentEdge currentPoint stop polygon|
	start := aPoint.
	polygonPoints := OrderedCollection new.
	polygonPoints add: start.
	sortedEdgesOfPoint := sortedEdges at: start.
	currentEdge := firstEdge.
	currentPoint := currentEdge connectionOf: start.
	polygon := nil.
	stop := false.
	[ currentPoint ~= start and: stop not ]
		whileTrue: [ polygonPoints add: currentPoint.
			(sortedEdges at: currentPoint) size <= 1
				ifTrue: [ stop := true	"there is no other edge beside the one we used to get to current point" ]
				ifFalse: [ currentEdge := self previousEdgeOf: currentEdge in: (sortedEdges at: currentPoint).
					currentPoint := currentEdge connectionOf: currentPoint ] ].
	stop
		ifFalse: [ "We stopped because we found the starting point again after turning left everytime"
			polygon := SGPolygon fromPoints: polygonPoints.
].
^ polygon