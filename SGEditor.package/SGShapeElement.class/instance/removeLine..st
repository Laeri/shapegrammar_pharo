removing
removeLine: aSGLine
	self removeChildren: (self children flatCollect: [ :aChild |
		aChild userData
			at: #shapeGrammarLine
			ifPresent: [ :aLine | aLine = aSGLine
				ifTrue: [ { aChild } ]
				ifFalse: [ #() ] ]
			ifAbsent: [ #() ] ])