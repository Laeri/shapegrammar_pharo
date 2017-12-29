convenience
allPointsTmpMatch: points in: otherPoints storeIn: matching
	| epsilon matchedPoints tmp1 tmp2 |
	epsilon := SGMatchSelector equalityRange.
	tmp1 := SGVector new.
	tmp2 := SGVector new.
	tmp1 z: 1.
	tmp2 z: 1.
	points
		do: [ :p1 | 
			matchedPoints := otherPoints
				select: [ :p2 | 
					tmp1 x: p1 xTmp ; y: p1 yTmp; z:1.
					tmp2 x: p2 xTmp; y: p2 yTmp; z:1.
					(tmp1 dist2D: tmp2) < epsilon ].
			matchedPoints size > 1
				ifTrue: [ 
					^ false ]
				ifFalse: [ matchedPoints size = 1
						ifTrue: [ matching at: p1 put: matchedPoints first ]
						ifFalse: [ ^ false ] ] ].
	^ true