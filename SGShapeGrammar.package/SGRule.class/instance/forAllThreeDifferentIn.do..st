iteration
forAllThreeDifferentIn: pointList do: aBlock
	"pointList permutationsDo: [ :thePoints |
		aBlock valueWithEnoughArguments: thePoints ]"
	pointList do:[:p1|
			pointList do:[:p2|
					pointList do:[:p3|
							((p1 ~= p2) and: ((p1 ~= p3) and: (p2 ~= p3))) ifTrue:[
									aBlock cull: p1 cull: p2  cull: p3. 
								].
						].
				]
		]