TriangleInlayGrammar
triangleInlayGrammarWithLabels
	<gtExample>
	| grammar |

	grammar := SGGrammar new.
	grammar addRule: self triangleInlayRuleWithLabels .
	^ grammar