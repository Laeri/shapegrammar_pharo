iteration
forAllDifferentPairsIn: pointList do: aBlock
	pointList
		do: [ :p1 | 
			pointList
				do: [ :p2 | 
							(self point: p1 differentFrom: p2)
								ifTrue: [ aBlock cull: p1 cull: p2] ] ] 