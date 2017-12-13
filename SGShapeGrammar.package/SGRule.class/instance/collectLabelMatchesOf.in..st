as yet unclassified
collectLabelMatchesOf: aMatch in: aShape
| labelDict basePointsOfAlphaLabel |
labelDict := aMatch alphaToBetaLabels .
aShape labels do:[:shapeLabel|
	aMatch alpha labels do:[:alphaLabel|
		basePointsOfAlphaLabel := aMatch allBasePointsOfAlphaPoints: alphaLabel points.
			(shapeLabel polygonPoints allSatisfy: [: polygonPoint|
					basePointsOfAlphaLabel includes: polygonPoint .
				 ]) ifTrue:[
					labelDict at: alphaLabel put: shapeLabel .
				].
		].
	
	]. 
^ labelDict .