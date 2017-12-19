RecursiveSquareGrammar
recursiveSquareGrammarWithLabels
| grammar rule |
grammar := SGGrammar new.
rule := self recursiveSquareRuleWithLabels.
grammar addRule: rule.
^ grammar.