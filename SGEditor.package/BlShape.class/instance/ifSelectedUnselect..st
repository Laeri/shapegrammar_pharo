as yet unclassified
ifSelectedUnselect: point
(firstSelectedPoint = point) ifTrue: [
	firstSelectedPoint := secondSelectedPoint .
	secondSelectedPoint := nil.
	  ].

(secondSelectedPoint = point) ifTrue:[
	secondSelectedPoint := nil.
	].