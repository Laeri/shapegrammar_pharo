grammars
triangleInlayGrammar
<gtExample>
| grammar |
grammar := SGGrammar new.
grammar addRule: self triangleInlayRule.
^ grammar.