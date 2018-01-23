accessing
rule: aRule
	| filter |
	filter := SGMatchFilter new.
	filter rule: aRule.
	^ filter