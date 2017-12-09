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
							tmpP equalTo: shapeP inRange: SGMatchSelector equalityRange . 
							 ].
				  ].
			somePresentPoints ifTrue:[rule addedVertices anySatisfy: testBlock ] ifFalse:[rule addedVertices allSatisfy: testBlock ].
			 ].
	^ usableRules