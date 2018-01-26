operations
build
|grammar|
grammar := SGGrammar new.
grammar name: name.
ruleBuilders do:[:builder|
	grammar addRule: builder build.	
].
^ grammar.