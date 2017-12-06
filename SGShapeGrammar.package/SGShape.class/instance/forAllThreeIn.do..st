iteration
forAllThreeIn: pointList do: aBlock
	pointList do: [ :p1 | pointList do: [ :p2 | pointList do: [ :p3 | aBlock cull: p1 cull: p2 cull: p3 ] ] ]