running
run: ruleApp on:shape
	| rule baseShape numRuleApplications |

	rule := self triangleInlayRule.
	rule gridValues: SGGridValues new.
	baseShape := shape.
	numRuleApplications := ruleApp.
	1 to: numRuleApplications do: [ :i | 
		rule applyOn: baseShape.
 ].