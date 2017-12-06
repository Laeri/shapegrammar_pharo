running
get: ruleApp
	| rule baseShape numRuleApplications |
	"baseShape := self squareMiddleApproxRuleBaseShape .
	rule := self squareMiddleApproxRule ."
	rule := self triangleInlayRule.
	rule gridValues: SGGridValues new.
	baseShape := self triangle.
	numRuleApplications := ruleApp.
	1 to: numRuleApplications do: [ :i | 
		rule applyOn: baseShape.
		].
	^ baseShape.