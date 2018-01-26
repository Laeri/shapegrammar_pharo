ruleExamples
emptyRule
<gtExample>
|ruleBuilder|
ruleBuilder := SGRuleBuilder new.
ruleBuilder	alpha points: {}.
ruleBuilder alpha	lines: {}.
ruleBuilder	beta points: {}.
ruleBuilder beta lines: {}.
ruleBuilder	map: {}.
^ ruleBuilder build.