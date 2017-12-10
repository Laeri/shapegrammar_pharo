operations
create
|grammar|
grammar := SGGrammar new.
grammar name: name.
ruleBuilders do:[:builder|
	grammar addRule: builder rule.	
].
^ grammar.