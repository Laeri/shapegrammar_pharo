accessing
filter: matches withRule: rule onShape: shape
	| usableRules |
	usableRules := matches.
	somePresentPoints 
		ifTrue: [ usableRules := self filterPresentPointsInRangeOn: usableRules withShape: shape andRule: rule.
			usableRules ifEmpty: [ self error: 'no match present after filtering based on range' ] ].
	intersection
		ifTrue:
			[ usableRules := self filterIntersections: usableRules shape: shape toShape: rule toShape.
			usableRules
				ifEmpty: [ self error: 'no match present after filtering based on intersection' ] ].
	^ usableRules