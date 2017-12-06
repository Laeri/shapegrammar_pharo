as yet unclassified
line: idToId
	| line pFrom pTo |
	pFrom := idToPoints at: idToId key.
	pTo := idToPoints at: idToId value.
	line := SGLine from: pFrom to: pTo.
	(lines includes: line)
		ifTrue: [ self error: 'tried to add line twice while building shape' ].
	lines add: line