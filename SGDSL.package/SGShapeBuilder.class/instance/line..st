accessing
line: idToId
	| line pFrom pTo |
	pFrom := idToPoints at: idToId key ifAbsent:[self findPointWith: idToId key].
	pTo := idToPoints at: idToId value ifAbsent:[self findPointWith: idToId value].
	line := SGLine from: pFrom to: pTo.
	(lines anySatisfy: [:aLine|
		aLine samePointsAs: line
		])
		ifTrue: [ self error: 'tried to add line twice while building shape' ].
	lines add: line