iteration
uniquePairsIn: pointList do: aBlock
	1 to: pointList size do: [ :i | i to: pointList size do: [ :j | aBlock cull: (pointList at: i) cull: (pointList at: j) ] ]