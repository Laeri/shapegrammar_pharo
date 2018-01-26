filtering
getMatchFrom: matches inShape: shape
	|hull1 hull2 area1 area2 |
	
	matches sort: [ :m1 :m2|
				hull1 := self convexHull: m1 alphaToBase values.
				hull2 := self convexHull: m2 alphaToBase values.
				area1 := self areaOf: hull1.
				area2 := self areaOf: hull2.
				area1 > area2.
		 ].
	
	^ matches first.
	