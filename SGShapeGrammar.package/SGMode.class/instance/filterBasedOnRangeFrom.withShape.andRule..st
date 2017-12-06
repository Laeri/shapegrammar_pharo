as yet unclassified
filterBasedOnRangeFrom: matchings withShape: shape andRule: rule
| usableRules localToBaseMatrix subToLocalMatrix tmpP |
	"or if any vertex is already present"
	self halt.
	usableRules := matchings
		reject: [ :match | 
			rule addedVertices anySatisfy: [:matchPoint|
						shape points anySatisfy: [:shapeP|
							tmpP := SGVector x: matchPoint x y: matchPoint y .
							subToLocalMatrix := match subToLocalMatrix .
							localToBaseMatrix := match baseToLocalMatrix getInv.
							subToLocalMatrix transform: tmpP.
							localToBaseMatrix transform: tmpP.
							
							tmpP equalTo: shapeP inRange: SGMode equalityRange . 
							 ].
				  ].
			 ].
	^ usableRules