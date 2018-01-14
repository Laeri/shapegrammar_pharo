accessing
showPolygons
showPolygons := true.
"(SGPolygon polygonsFromShape: shape) do: [ :aSGPolygon|
		self addChild: (self createPolygon: aSGPolygon ) at: 1.
	 ]."
self halt.
shape labels do:[:label|
		(label isKindOf: SGPolygonLabel) ifTrue:[
				self addChild: (self createPolygon: label polygon).
			]. 
	].