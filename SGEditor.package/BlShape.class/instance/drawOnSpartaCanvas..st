drawing
drawOnSpartaCanvas: aCanvas
	| circle point p1 p2 linePath defaultCircleColor firstSelectedColor secondSelectedColor usedColor visualizeMatchColorPoints visualizeMatchColorLines tmpPoints lineColor |
	match
		ifNotNil: [ visualizeMatchColorPoints := Color white.
			visualizeMatchColorLines := Color yellow.
			tmpPoints := match betaToBase values ].
	shape lines
		do: [ :l | 
			lineColor := Color red.
			p1 := l from x @ l from y.
			p2 := l to x @ l to y.
			p1 := p1.
			p2 := p2.
			match
				ifNotNil: [ ((match alphaToBase values includes: l from)
						and: (match alphaToBase values includes: l to))
						ifTrue: [ lineColor := visualizeMatchColorLines ] ].
			linePath := aCanvas path
				moveTo: p1 * self extent;
				lineTo: p2 * self extent;
				close;
				finish.
			aCanvas stroke
				path: linePath;
				paint: lineColor;
				width: 2;
				draw ].
	defaultCircleColor := Color black.
	firstSelectedColor := Color red.
	secondSelectedColor := Color red darker darker.
	shape points
		do: [ :p | 
			usedColor := defaultCircleColor.
			
			match
				ifNotNil: [ "color points"
					(tmpPoints includes: p)
						ifTrue: [ usedColor := visualizeMatchColorPoints ] ].
			firstSelectedPoint = p
				ifTrue: [ usedColor := firstSelectedColor ].
			secondSelectedPoint = p
				ifTrue: [ usedColor := secondSelectedColor ].
			
			point := p x @ p y.
			point := point * self extent.
			circle := aCanvas shape circleAt: point radius: 4.
			aCanvas fill
				paint: usedColor;
				path: circle;
				draw ]