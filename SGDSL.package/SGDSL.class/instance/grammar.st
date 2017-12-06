accessing
grammar
grammar := SGGrammar new.
ruleBuilders do:[:ruleBuilder|
	grammar addRule: ruleBuilder rule.
	].
self name ifNotNil:[grammar name: self name].
^ grammar.