as yet unclassified
filterPresentPointsInRangeOn: matchings withShape: shape andRule: rule
| usableRules localToBaseMatrix subToLocalMatrix tmpP testBlock |
	"or if any vertex is already present"
	usableRules := matchings
		reject: [ :match | 
			testBlock := [:matchPoint|
						shape points anySatisfy: [:shapeP|
							tmpP := SGVector x: matchPoint x y: matchPoint y .
							subToLocalMatrix := match subToLocalMatrix .
							localToBaseMatrix := match baseToLocalMatrix getInv.
							subToLocalMatrix transform: tmpP.
							localToBaseMatrix transform: tmpP.
							tmpP closeTo: shapeP precision: SGMatchSelector equalityRange . 
							 ].
				  ].
			somePresentPoints ifTrue:[rule addedPoints anySatisfy: testBlock ] ifFalse:[rule addedPoints allSatisfy: testBlock ].
			 ].
	^ usableRules