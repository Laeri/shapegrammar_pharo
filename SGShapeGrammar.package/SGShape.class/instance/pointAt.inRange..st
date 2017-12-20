accessing
pointAt: pos inRange: range
	| minRange nearestPoint distance |
	minRange := 1000000.
	nearestPoint := nil.
	self points
		detect: [ :p | p closeTo: pos precision: range ]
		ifFound: [ :p | 
			distance := p dist2D: pos.
			distance < minRange
				ifTrue: [ minRange := distance.
					nearestPoint := p ] ].
	^ nearestPoint