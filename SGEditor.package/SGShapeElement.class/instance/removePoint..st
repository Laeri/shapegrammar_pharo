removing
removePoint: aSGVector
	self removeChildren: (self children flatCollect: [ :aChild |
		aChild userData
			at: #shapeGrammarPoint
			ifPresent: [ :aPoint | aPoint = aSGVector
				ifTrue: [ { aChild } ]
				ifFalse: [ #() ] ]
			ifAbsent: [ #() ] ])