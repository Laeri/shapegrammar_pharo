as yet unclassified
rule: aRule
	| filter |
	filter := SGMatchFilter new.
	filter rule: aRule.
	^ filter