as yet unclassified
findPolygons
	<return: #SequenceableCollection of: #BlElement>

	^ self children flatCollect: [ :aChild |
		aChild userData
			at: #shapeGrammarPolygon
			ifPresent: [ { aChild } ]
			ifAbsent: [ #() ] ]