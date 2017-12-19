accessing
grammar: anObject
	grammar := anObject.
	grammar rules
		ifNotEmpty:[ self currentRule: grammar rules first ]