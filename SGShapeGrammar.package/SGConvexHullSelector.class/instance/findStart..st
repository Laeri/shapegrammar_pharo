as yet unclassified
findStart: points
	| minX minY bestPoint |
	minX := 100000000000000000.
	minY := 100000000000000000.
	bestPoint := nil.
	points
		do: [ :point | 
			point x < minY
				ifTrue: [ minY := point y.
					minX := point x.
					bestPoint := point ]
				ifFalse: [ point y = minY
						ifTrue: [ point x < minX
								ifTrue: [ minX := point x.
									bestPoint := point ] ] ] ].
	^ bestPoint