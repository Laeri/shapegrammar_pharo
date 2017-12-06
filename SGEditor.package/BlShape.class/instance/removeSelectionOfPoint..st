update
removeSelectionOfPoint: point
(secondSelectedPoint = point) ifTrue:[secondSelectedPoint := nil].
(firstSelectedPoint = point) ifTrue:[firstSelectedPoint := secondSelectedPoint . secondSelectedPoint := nil]. 