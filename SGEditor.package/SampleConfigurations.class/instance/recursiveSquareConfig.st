config
recursiveSquareConfig
<gtExample>
	| config |
	config := SGConfiguration new. 
	config grammar: SGGrammarExamples new recursiveSquareGrammar.
	config shape: SGShapeExamples new square.
	^ config