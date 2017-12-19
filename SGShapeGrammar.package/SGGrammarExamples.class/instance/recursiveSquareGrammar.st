RecursiveSquareGrammar
recursiveSquareGrammar
| grammar rule |
grammar := SGGrammar new.
rule := self recursiveSquareRule.
grammar addRule: rule.
^ grammar.