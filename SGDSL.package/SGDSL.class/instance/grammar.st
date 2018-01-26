accessing
grammar
grammar := SGGrammar new.
ruleBuilders do:[:ruleBuilder|
	grammar addRule: ruleBuilder build.
	].
self name ifNotNil:[grammar name: self name].
^ grammar.