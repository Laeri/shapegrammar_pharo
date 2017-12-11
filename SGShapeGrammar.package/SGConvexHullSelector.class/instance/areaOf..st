as yet unclassified
areaOf: polygon
	| toP1 toP2 start area triangleArea |
	toP1 := SGVector new.
	toP2 := SGVector new.
	start := polygon at: 1.
	area := 0.
	2 to: (polygon size-1)  do: [ :i | 
		toP1 := (polygon at: i) - start.
		toP2 := (polygon at: (i + 1)) - start.
		triangleArea := toP1 x * toP2 y - (toP1 y * toP1 x).
		triangleArea < 0 ifTrue:[triangleArea := triangleArea negated].
		triangleArea := triangleArea / 2.
		area := area + triangleArea .
		 ].
	
	^ area.
	