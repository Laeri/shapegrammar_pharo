searching
findPoints
	<return: #SequenceableCollection of: #BlElement>

	^ self children flatCollect: [ :aChild |
		aChild userData
			at: #shapeGrammarPoint
			ifPresent: [ { aChild } ]
			ifAbsent: [ #() ] ]