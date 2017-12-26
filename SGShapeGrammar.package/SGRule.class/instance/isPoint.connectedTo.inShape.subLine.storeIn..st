testing
isPoint: p1 connectedTo: p2 inShape: shape subLine: subLine storeIn: lineMatching
	|connections|
	connections := shape lines
		select:
			[ :line | line connects: p1 with: p2 ].
	connections size > 1
		ifTrue: [ self error: 'More than one matching found' ].
	connections isEmpty
		ifTrue: [ ^ false ].
	lineMatching at: subLine put: connections first.
	^ true