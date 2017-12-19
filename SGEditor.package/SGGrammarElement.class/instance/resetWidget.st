as yet unclassified
resetWidget
	self removeChildren.

	grammar rules do: [ :rule | 
		| ruleElement |
		ruleElement := SGRuleElement rule: rule.
		self addChild: ruleElement ]