inlay
triangleInlayColourConfig
<gtExample> 
	| config | 
	config := SGConfiguration new.
	config grammar: SGGrammarExamples new triangleInlayGrammarWithLabels.
	config shape: SGGrammarExamples new triangleWithLabel.
	^ config