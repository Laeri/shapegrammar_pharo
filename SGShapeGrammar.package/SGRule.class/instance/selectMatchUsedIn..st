match calculation
selectMatchUsedIn: shape
	| matchings usableRules matchUsed |
	self update.
	matchings := self matchingsIn: shape.
	matchings ifEmpty: [ self error: 'No matchings found for rule' ].
	usableRules := filter filter: matchings withShape: shape.
	matchUsed := matchSelector
		getMatchFrom: usableRules
		inShape: shape.
	^ matchUsed