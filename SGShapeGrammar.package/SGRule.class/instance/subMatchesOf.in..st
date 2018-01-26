testing
subMatchesOf: subShape in: baseShape
	| baseToLocalMatrix subTransform subPoints basePoints doPointsMatch matchings pointMatching lineMatching match allLinesMatch fromBetaToBase testBlock subSystem |
	subPoints := subShape points.
	basePoints := baseShape points.
	subSystem := self coordinateSystemFrom: subPoints.
	subTransform := subSystem transformationMatrix .
	subTransform invert.
	subTransform transformAllTmp: subPoints.
	matchings := OrderedCollection new.
	optimization isInitialized ifFalse:[
			optimization startWith: baseShape .
		].
	testBlock := [ :p1 :p2 :p3 | 
			match := SGShapeMatch new.
			baseToLocalMatrix := SGMatrix p1: p1 p2: p2 p3: p3.
			baseToLocalMatrix det = 0
				ifFalse: [ baseToLocalMatrix invert.
					baseToLocalMatrix transformAllTmp: basePoints.
					pointMatching := Dictionary new.
					doPointsMatch := SGShape allPointsTmpMatch: subPoints in: basePoints storeIn: pointMatching.
					doPointsMatch
						ifTrue: [ match alphaToBase: pointMatching.
							fromBetaToBase := Dictionary new.
							self alphaToBeta
								keysAndValuesDo: [ :key :value | fromBetaToBase at: value put: (match alphaToBase at: key) ].
							match betaToBase: fromBetaToBase.
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
									match coordinates: (SGCoordinateSystem
										origin: p1
										x: p2 - p1
										y: p3 - p1).
									matchings add: match.
									self newGeometryOf: match presentIn: baseShape givenRule: self.
									match alphaToBaseLabels: (self collectLabelMatchesOf: match in: baseShape).
									 ] ] ] ].
	
	optimization forAllThreeIn: baseShape  do: testBlock . 
	^ matchings