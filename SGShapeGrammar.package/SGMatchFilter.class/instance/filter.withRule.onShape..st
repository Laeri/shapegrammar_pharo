accessing
filter: matches withRule: rule onShape: shape
|usableRules|
usableRules := matches.
usableRules := self
		filterAlreadyPresentMatchesFrom: usableRules 
		withShape: shape
		andRule: rule.
		usableRules ifEmpty:[self error: 'no matche present after filtering based if already present in base'].
		
	usableRules := self filterBasedOnRangeFrom: usableRules withShape: shape  andRule: rule. 
	usableRules ifEmpty: [self error:'no match present after filtering based on range'  ].
	usableRules := self filterIntersections: usableRules shape: shape toShape: rule toShape.
	usableRules ifEmpty: [self error:'no match present after filtering based on intersection'  ].
	^ usableRules .