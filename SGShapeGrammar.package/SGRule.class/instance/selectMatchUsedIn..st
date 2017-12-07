match calculation
selectMatchUsedIn: shape
	| matchings usableRules matchUsed |
	matchings := self matchingsIn: shape.
	matchings ifEmpty: [ self error: 'No matchings found for rule' ].
	usableRules := filter
		filterAlreadyPresentMatchesFrom: matchings
		withShape: shape
		andRule: self.
		usableRules ifEmpty:[self error: 'no matche present after filtering based if already present in base'].
		
	usableRules := filter filterBasedOnRangeFrom: usableRules withShape: shape  andRule: self. 
	usableRules ifEmpty: [self error:'no match present after filtering based on range'  ].
	usableRules := filter filterIntersections: usableRules shape: shape toShape: toShape.
	usableRules ifEmpty: [self error:'no match present after filtering based on intersection'  ].
	matchUsed := mode getMatch: usableRules fromRule: self.
	^ matchUsed