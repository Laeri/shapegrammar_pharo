searching
findLines
	<return: #SequenceableCollection of: #BlElement>

	^ self children flatCollect: [ :aChild |
		aChild userData
			at: #shapeGrammarLine
			ifPresent: [ { aChild } ]
			ifAbsent: [ #() ] ]