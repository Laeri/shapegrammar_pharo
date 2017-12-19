instance creation
createLine: aSGLine
	| aLine |

	aLine := self newLine.
	aLine userData at: #shapeGrammarLine put: aSGLine.
	^ aLine