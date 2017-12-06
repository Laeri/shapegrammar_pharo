as yet unclassified
toSymbolIfNeeded: aVal
	(aVal class = Character or: (aVal isKindOf: String))
		ifTrue: [ ^ (String new writeStream << '#' << aVal) contents ]
		ifFalse: [ ^ aVal ]