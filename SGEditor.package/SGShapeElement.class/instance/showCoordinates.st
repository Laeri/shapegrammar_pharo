coordinate system
showCoordinates
	| anOriginPoint aPointX aPointY xAxis yAxis |
	
	self hideCoordinates.
	
	anOriginPoint := self createCoordinatePoint: self match coordinates origin.
	aPointX := self createCoordinatePoint: self match coordinates origin + self match coordinates xAxis.
	aPointY := self createCoordinatePoint: self match coordinates origin + self match coordinates yAxis.

	xAxis := self createAxisLine
		fromAnchor: (BlElementCenterAnchor element: anOriginPoint);
		toAnchor: (BlElementCenterAnchor element: aPointX).

	yAxis := self createAxisLine
		fromAnchor: (BlElementCenterAnchor element: anOriginPoint);
		toAnchor: (BlElementCenterAnchor element: aPointY).

	self addChildren: { anOriginPoint . aPointX . aPointY . xAxis . yAxis }