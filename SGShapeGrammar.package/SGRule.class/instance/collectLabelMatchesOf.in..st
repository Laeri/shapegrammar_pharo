as yet unclassified
collectLabelMatchesOf: aMatch in: aShape
| labelDict basePointsOfAlphaLabel |
labelDict := aMatch alphaToBaseLabels .
aShape labels do:[:shapeLabel|
	self alpha labels do:[:alphaLabel|
		basePointsOfAlphaLabel := aMatch allBasePointsOfAlphaPoints: alphaLabel polygonPoints.
			(shapeLabel polygonPoints allSatisfy: [: polygonPoint|
					basePointsOfAlphaLabel includes: polygonPoint .
				 ]) ifTrue:[
					labelDict at: alphaLabel put: shapeLabel .
				].
		].
	
	]. 
^ labelDict .