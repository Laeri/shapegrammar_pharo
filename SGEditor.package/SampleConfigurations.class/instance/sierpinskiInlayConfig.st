config
sierpinskiInlayConfig
<gtExample>
	| config |
	config := SGConfiguration new.
	config grammar: SGGrammarExamples new sierpinskiInlay.
	config shape: SGShapeExamples new triangle.
	^ config