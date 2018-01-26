instance creation
newRule
	| ruleBuilder |
	ruleBuilder := SGRuleBuilder new.
	ruleBuilders add: ruleBuilder.
	^ ruleBuilder