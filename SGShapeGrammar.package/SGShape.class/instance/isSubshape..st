testing
isSubshape: shape
	| baseToLocalMatrix subTransform subPoints basePoints doPointsMatch data pointMatching lineMatching subData allLinesMatch |
	subPoints := shape points.
	basePoints := points.
	subTransform := SGMatrix
		p1: (subPoints at: 1)
		p2: (subPoints at: 2)
		p3: (subPoints at: 3).
	subTransform invert.
	subTransform transformAllTmp: subPoints.
	data := OrderedCollection new.
	self
		forAllThreeDifferentIn: points
		do: [ :p1 :p2 :p3 | 
			"Transcript show: p1;cr;show:p2;cr;show:p3;cr."
		"	(((p1 x = 0.25 and: p1 y = 0) and: (p2 x = 1.0 and: p2 y = 0.25))) ifTrue: [ self halt. ]."
			subData := SubData new.
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
						ifTrue: [ subData alphaToBase: pointMatching.
							lineMatching := Dictionary new.
							allLinesMatch := shape lines
								allSatisfy: [ :line | 
									self
										isPoint: (pointMatching at: line from)
										connectedTo: (pointMatching at: line to)
										subLine: line
										storeIn: lineMatching ].
							allLinesMatch
								ifTrue: [ subData baseToLocalMatrix: baseToLocalMatrix.
									subData subToLocalMatrix: subTransform.
									subData lineMatch: lineMatching.
									subData p1: p1 p2: p2 p3: p3.
									data add: subData ] ] ] ].
	^ data