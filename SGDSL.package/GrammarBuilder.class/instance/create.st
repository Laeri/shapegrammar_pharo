operations
create
|grammar|
grammar := SGGrammar new.
ruleBuilders do:[:builder|
	grammar addRule: builder rule.	
].
^ grammar.