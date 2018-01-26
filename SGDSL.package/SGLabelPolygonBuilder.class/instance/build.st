building
build
	| polygon polygonPoints |
	polygon := SGPolygon new.
	polygonPoints := OrderedCollection new.
	self points
		do: [ :idOrPoint | 
			(idOrPoint isKindOf: SGVector)
				ifTrue: [ polygonPoints add: idOrPoint ]
				ifFalse: [ polygonPoints add: (idToPoint at: idOrPoint) ] ].
			
		polygon points: polygonPoints .
		^ polygon