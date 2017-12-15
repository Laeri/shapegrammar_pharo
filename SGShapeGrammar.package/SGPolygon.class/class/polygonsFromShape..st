instance creation
polygonsFromShape: aShape
	| polygon sortedEdges start polygons currentEdge currentPoint sortedEdgesOfPoint stop polygonPoints |
	polygons := OrderedCollection new.
	sortedEdges := Dictionary new.
	"for every point sort its edges in counterclockwise order by angle"
	aShape points do: [ :aPoint | sortedEdges at: aPoint put: (self sortedEdgesOf: aPoint in: aShape) ].

	"for every point we follow the first edge and always go to the left until we reach the starting point again or there are no more edges"
	aShape points
		do: [ :aPoint | 
			(sortedEdges at: aPoint) do: [ :firstEdge|
					polygon := self findPolygonFrom: aPoint withFirstEdge: firstEdge   inSortedEdges: sortedEdges .
					self halt. 
				 ].
			].
			
		^ polygons.