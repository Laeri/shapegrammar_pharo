match calculation
selectMatchUsedInShape: shape
	| matchings usableRules matchUsed |
	matchings := self getMatchingsInShape: shape.
	matchings ifEmpty: [ self error: 'No matchings found for rule' ].
	usableRules := mode
		filterAlreadyPresentMatchesFrom: matchings
		withShape: shape
		andRule: self.
		usableRules ifEmpty:[self error: 'no matche present after filtering based if already present in base'].
		
	usableRules := mode filterBasedOnRangeFrom: usableRules withShape: shape  andRule: self. 
	usableRules ifEmpty: [self error:'no match present after filtering based on range'  ].
	usableRules := mode filterIntersections: usableRules shape: shape toShape: toShape.
	usableRules ifEmpty: [self error:'no match present after filtering based on intersection'  ].
	matchUsed := mode getMatch: usableRules fromRule: self.
	^ matchUsed