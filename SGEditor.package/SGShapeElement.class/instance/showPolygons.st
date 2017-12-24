accessing
showPolygons
showPolygons := true.
(SGPolygon polygonsFromShape: shape) do: [ :aSGPolygon|
	self halt.
		self addChild: (self createPolygon: aSGPolygon ) at: 1.
	 ].