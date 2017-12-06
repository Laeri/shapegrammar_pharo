TriangleInlayGrammar
triangleInlayGrammar
| grammar |
grammar := SGGrammar new.
grammar addRule: self triangleInlayRule.
^ grammar.