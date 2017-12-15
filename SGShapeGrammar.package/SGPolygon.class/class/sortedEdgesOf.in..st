as yet unclassified
sortedEdgesOf: aPoint in: aShape
| sortedEdges |
sortedEdges := aShape linesFromOrTo: aPoint.
sortedEdges sort:[:edge1 :edge2|
		(edge1 vectorFrom: aPoint)angle < (edge2 vectorFrom: aPoint)angle 
	].
^ sortedEdges .