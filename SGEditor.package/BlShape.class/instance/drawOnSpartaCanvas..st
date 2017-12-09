drawing
drawOnSpartaCanvas: aCanvas
	| circle point p1 p2 linePath defaultCircleColor firstSelectedColor secondSelectedColor usedColor visualizeMatchColorPoints visualizeMatchColorLines tmpPoints lineColor transf point2D point1 point2 gridMaxX girdMaxY gridMaxY |
	transf := BlScalingTransformation new.
	transf scale: self extent x , self extent y.
	point1 := BlPoint2D new.
	point2 := BlPoint2D new.
	lineColor := Color black.
	"Draw Grid"
	
	gridMaxX := gridX.
	gridMaxY := gridY.
	useUniformGrid ifTrue:[
		gridMaxX := self extent x / self gridWidth .
		gridMaxY := self extent y / self gridHeight .
		].
	1 to: gridMaxY do: [ :y | 
			linePath := aCanvas path
				moveTo: (0 @ y * self gridHeight );
				lineTo: (self extent x) @ (y * self gridHeight );
				close;
				finish.
			aCanvas stroke
				path: linePath;
				paint: lineColor;
				width: 0.5;
				draw.
		1 to: gridMaxX do: [ :x | 
			linePath := aCanvas path
				moveTo: (x * self gridWidth) @ 0;
				lineTo: (x * self gridWidth) @ self extent y;
				close;
				finish.
			aCanvas stroke
				path: linePath;
				paint: lineColor;
				width: 0.05;
				draw ] ].
	match
		ifNotNil: [ visualizeMatchColorPoints := Color white.
			visualizeMatchColorLines := Color yellow.
			tmpPoints := match betaToBase values ].
	shape lines
		do: [ :l | 
			lineColor := Color red.
			"p1 := l from x@ l from y.
			p2 := l to x @ l to y.
			p1 := transf transformPoint: p1.
			p2 := transf transformPoint: p2.
			"
			point1 x: l from x y: l from y.
			point2 x: l to x y: l to y.
			p1 := point1 x @ point1 y.
			p2 := point2 x @ point2 y.
			p1 := p1 * self extent.
			p2 := p2 * self extent.
			match
				ifNotNil: [ ((match alphaToBase values includes: l from)
						and: (match alphaToBase values includes: l to))
						ifTrue: [ lineColor := visualizeMatchColorLines ] ].
			linePath := aCanvas path
				moveTo: p1;
				lineTo: p2;
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