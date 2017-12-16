testing
inside: aPoint
	| vecToPoint startPos numIntersections nextIndex |
	startPos := SGVector x: -150 y: -100.	"some starting position we know is outside of the polygon"
	vecToPoint := SGVector new.
	vecToPoint
		x: aPoint x - startPos x;
		y: aPoint y - startPos y;
		z: 1.
	"count every intersection with the polygon"
	numIntersections := 0.
	points
		doWithIndex: [ :point :index | 
			nextIndex := (index + 1) .
			(nextIndex > points size) ifTrue:[nextIndex := 1].
			(SGLine
				lineFrom: point
				to: (points at: nextIndex)
				intersectsFrom: startPos
				to: aPoint)
				ifTrue: [ numIntersections := numIntersections + 1 ] ].
	^ numIntersections even not. "if uneven number point is inside polygon"	
		