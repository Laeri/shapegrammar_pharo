as yet unclassified
resetWidget
	| ruleRep |
	self removeChildren.
	grammar rules
		do: [ :rule | 
			ruleRep := SGRuleWidget fromRule: rule.
			self addChild: ruleRep ].