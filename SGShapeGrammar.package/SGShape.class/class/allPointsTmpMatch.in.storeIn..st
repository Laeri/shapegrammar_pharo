convenience
allPointsTmpMatch: points in: otherPoints storeIn: matching
	| epsilon matchedPoints tmp1 tmp2|
	epsilon := SGMode equalityRange.
	tmp1 := SGVector new.
	tmp2 := SGVector new.
	points
		do: [ :p1 | 
			matchedPoints := otherPoints
				select: [ :p2 | 
					tmp1 x: p1 xTmp; y: p1 yTmp.
					tmp2 x: p2 xTmp; y: p2 yTmp.
					(tmp1 dist2D: tmp2) < epsilon.
						 ].
					"self halt."
					((matchedPoints size) > 1) ifTrue:[Transcript show:'More than one match found in point comparison'. ^false]
					ifFalse:[(matchedPoints size) = 1 ifTrue:[
							matching at: p1 put: (matchedPoints at: 1)]
						ifFalse:[^ false]
					 ]].
			^ true