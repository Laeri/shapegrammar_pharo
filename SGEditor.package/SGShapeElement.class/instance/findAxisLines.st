searching
findAxisLines
	<return: #SequenceableCollection of: #BlElement>

	^ self children flatCollect: [ :aChild |
		aChild userData
			at: #shapeGrammarAxisLine
			ifPresent: [ { aChild } ]
			ifAbsent: [ #() ] ]