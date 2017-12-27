config
squareInlayConfig
<gtExample>
	| config |
	config := SGConfiguration new.
	config grammar: SGGrammarExamples new squareGrammar.
	config shape: SGShapeExamples new square.
	^ config