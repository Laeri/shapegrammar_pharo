removing
removeSelection: p
firstSelectedPoint = p ifTrue:[firstSelectedPoint := secondSelectedPoint . secondSelectedPoint := nil].
secondSelectedPoint = p ifTrue:[secondSelectedPoint := nil.]