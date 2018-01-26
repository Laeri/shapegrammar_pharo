filtering
getMatchFrom: matches inShape: shape
	| addedVertices distanceSqrt x y currentDistance dx dy distances bestDifference |
	
	bestDifference := 10000000000000000000000.
	bestMatch := nil.
	matches do:[:match|
		bestDifference := 0.
		distances := OrderedCollection new.
		match alphaToBase values do:[:baseP1|
				match alphaToBase values do:[:baseP2|
						dx := baseP1 x - baseP2 x.
						dy := baseP1 y - baseP2 y.
						currentDistance := currentDistance + (dx*dx) + (dy*dy).
					].
			].
		currentDistance  < bestDistance ifTrue:[
				bestDistance := currentDistance .
				bestMatch := match.
			].
		].
	^ bestMatch.
	"addedVertices := rule addedVertices.
	bestDistance := -1. ""Best distance should be high!""
	bestMatch := nil.
	matches
		do: [ :match | 
			currentDistance := 0.
			addedVertices
				do: [ :addedV | 
					match subToLocalMatrix transformTmp: addedV.
					match baseToLocalMatrix getInv transformTmp: addedV.
					x := addedV xTmp.
					y := addedV yTmp.
					
					shape points
						do: [ :baseP | 
							dx := x - baseP x.
							dy := y - baseP y.
							currentDistance := currentDistance + (dx * dx)+ (dy + dy). ].
					].
				
			(currentDistance  > bestDistance)
				ifTrue: [ bestDistance := currentDistance .
					bestMatch := match ] ].
	^ bestMatch"