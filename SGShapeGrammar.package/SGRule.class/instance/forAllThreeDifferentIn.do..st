iteration
forAllThreeDifferentIn: pointList do: aBlock
	pointList permutationsDo: [ :thePoints |
		aBlock valueWithEnoughArguments: thePoints ]