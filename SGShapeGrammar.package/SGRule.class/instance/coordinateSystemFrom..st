as yet unclassified
coordinateSystemFrom: somePoints
	| system p2 origin dx dy |
	system := SGCoordinateSystem new.
	origin := somePoints first.
	p2 := somePoints second.
	somePoints
		doWithIndex: [ :p3 :anIndex | 
			anIndex >= 3
				ifTrue: [ 
					dx := p2 - origin.
					dy := p3 - origin.
					((dx crossProduct2D: dy) ~= 0) ifTrue: [ 
							system origin: origin.
							system xAxis: dx.
							system yAxis: dy.
							^ system.
						 ].
					 ] ].
			self error: 'No coordinate system found'.