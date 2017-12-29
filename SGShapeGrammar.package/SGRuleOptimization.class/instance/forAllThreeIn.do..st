as yet unclassified
forAllThreeIn: aShape do: aBlock
	onlyNewPoints
		ifTrue: [ newPoints addAll: initialPoints.
			rule forAllThreeDifferentIn: newPoints do: aBlock.
			 ]
		ifFalse: [ rule forAllThreeDifferentIn: aShape points do: aBlock ]