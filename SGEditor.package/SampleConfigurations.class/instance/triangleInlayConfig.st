inlay
triangleInlayConfig
<gtExample> 
	| config |
	config := SGConfiguration new.
	config grammar: SGGrammarExamples new triangleInlayGrammar.
	config shape: SGShapeExamples new triangle.
	^ config