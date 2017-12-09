as yet unclassified
getMatch: matches fromRule: rule fromBaseShape: shape
	| addedVertices distanceSqrt x y currentDistance dx dy |
	addedVertices := rule addedVertices.
	bestDistance := -1. "Best distance should be high!"
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
	^ bestMatch