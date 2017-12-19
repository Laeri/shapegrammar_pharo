as yet unclassified
resetWidget
	| ruleRep |
	self removeChildren.
	grammar rules
		do: [ :rule | 
			ruleRep := SGRuleElement rule: rule.
			self addChild: ruleRep ].