filtering
getMatch: matches fromRule: rule andShape: shape
	|convexHull|
	convexHull := self convexHull: shape.
	