searching
findPoints: aSGVector
	<return: #SequenceableCollection of: #BlElement>

	^ self children flatCollect: [ :aChild |
		aChild userData
			at: #shapeGrammarPoint
			ifPresent: [ :aPoint | aPoint = aSGVector
				ifTrue: [ { aChild } ]
				ifFalse: [ #() ] ]
			ifAbsent: [ #() ] ]