testing
isPoint: p1 connectedTo: p2
	| connections |
	connections := lines
		select:
			[ :line | (line from = p2 and: line to = p1) or: (line to = p2 and: line from = p1) ].
	^ connections isNotEmpty