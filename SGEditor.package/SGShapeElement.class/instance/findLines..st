searching
findLines: aSGLine
	<return: #SequenceableCollection of: #BlElement>

	^ self children flatCollect: [ :aChild |
		aChild userData
			at: #shapeGrammarLine
			ifPresent: [ :aLine | aLine = aSGLine
				ifTrue: [ { aChild } ]
				ifFalse: [ #() ] ]
			ifAbsent: [ #() ] ]