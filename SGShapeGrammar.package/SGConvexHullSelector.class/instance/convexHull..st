as yet unclassified
convexHull: points
	| start polygon index polPoint1 polPoint2 currentPoint finished toP1 toP2 angle1 angle2 |
	"from https://en.wikipedia.org/wiki/Graham_scan"
	start := self findStart: points.
	polygon := OrderedCollection new.
	polygon add: start.
	points
		sort: [ :p1 :p2 | 
			p1 = start
				ifTrue: [ true ]
				ifFalse: [ p2 = start
						ifTrue: [ false ]
						ifFalse: [ toP1 := p1 - start.
							toP1 normalize.
							angle1 := toP1 angle.
							toP2 := p2 - start.
							toP2 normalize.
							angle2 := toP2 angle.
							angle1 < angle2 ] ] ].
	index := 3.
	polygon add: points second.
	[ index <= points size ]
		whileTrue: [ polPoint1 := polygon last.
			polPoint2 := polygon at: polygon size - 1.
			currentPoint := points at: index.
			finished := false.
			[ finished not and: (self ccw: polPoint1 and: polPoint2 and: currentPoint) <= 0 ]
				whileTrue: [ index := index + 1.
					index <= points size
						ifTrue: [ currentPoint := points at: index ]
						ifFalse: [ finished := true ] ].
			index <= points size
				ifTrue: [ polygon add: (points at: index).
					index := index + 1 ] ].
	polygon last = points last
		ifFalse: [ polygon add: points last ].
	
	^ polygon