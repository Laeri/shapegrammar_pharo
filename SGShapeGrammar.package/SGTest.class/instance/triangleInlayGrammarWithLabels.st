TriangleInlayGrammar
triangleInlayGrammarWithLabels
| grammar |
grammar := SGGrammar new.
grammar addRule: self triangleInlayRuleWithLabels .
^ grammar.