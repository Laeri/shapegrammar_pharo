match calculation
selectMatchUsedIn: shape
	| matchings usableRules matchUsed |
	matchings := self matchingsIn: shape.
	matchings ifEmpty: [ self error: 'No matchings found for rule' ].
	usableRules := filter filter: matchings withRule: self onShape: shape.
	matchUsed := mode getMatch: usableRules fromRule: self.
	^ matchUsed