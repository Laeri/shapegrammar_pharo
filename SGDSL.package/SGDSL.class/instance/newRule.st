instance creation
newRule
	| ruleBuilder |
	ruleBuilder := RuleBuilder new.
	ruleBuilders add: ruleBuilder.
	^ ruleBuilder