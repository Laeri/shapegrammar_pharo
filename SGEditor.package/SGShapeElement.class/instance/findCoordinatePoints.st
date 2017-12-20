searching
findCoordinatePoints
	<return: #SequenceableCollection of: #BlElement>

	^ self children flatCollect: [ :aChild |
		aChild userData
			at: #shapeGrammarCoordinatePoint
			ifPresent: [ { aChild } ]
			ifAbsent: [ #() ] ]