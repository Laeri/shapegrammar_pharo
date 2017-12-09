as yet unclassified
unselect: point
(firstSelectedPoint = point) ifTrue:[firstSelectedPoint := secondSelectedPoint ].
(secondSelectedPoint = point) ifTrue:[secondSelectedPoint := nil].