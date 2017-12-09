actions
load: aConfiguration

ruleColumn removeChildren.
grammar := aConfiguration grammar.
grammar rules do:[:rule|
		ruleColumn addChild: (SGRuleWidget fromRule: rule).
	].
ruleColumn addChild: addNewRuleButton .
