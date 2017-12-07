testing
subMatchesOf: subShape in: baseShape
	| baseToLocalMatrix subTransform subPoints basePoints doPointsMatch matchings pointMatching lineMatching match allLinesMatch |
	subPoints := subShape points.
	basePoints := baseShape points.
	subTransform := SGMatrix
		p1: (subPoints at: 1)
		p2: (subPoints at: 2)
		p3: (subPoints at: 3).
	subTransform invert.
	subTransform transformAllTmp: subPoints.
	matchings := OrderedCollection new.
	self
		forAllThreeDifferentIn: basePoints
		do: [ :p1 :p2 :p3 | 
			match := SGShapeMatch new.
			baseToLocalMatrix := SGMatrix p1: p1 p2: p2 p3: p3.
			baseToLocalMatrix det = 0
				ifFalse: [ baseToLocalMatrix invert.
					baseToLocalMatrix transformAllTmp: basePoints.
					pointMatching := Dictionary new.
					doPointsMatch := SGShape
						allPointsTmpMatch: subPoints
						in: basePoints
						storeIn: pointMatching.
					doPointsMatch
						ifTrue: [ match alphaToBase: pointMatching.
							lineMatching := Dictionary new.
							allLinesMatch := subShape lines
								allSatisfy: [ :line | 
									self
										isPoint: (pointMatching at: line from)
										connectedTo: (pointMatching at: line to)
										inShape: baseShape
										subLine: line
										storeIn: lineMatching ].
							allLinesMatch
								ifTrue: [ match baseToLocalMatrix: baseToLocalMatrix.
									match subToLocalMatrix: subTransform.
									match lineMatch: lineMatching.
									match p1: p1 p2: p2 p3: p3.
									matchings add: match ] ] ] ].
	^ matchings