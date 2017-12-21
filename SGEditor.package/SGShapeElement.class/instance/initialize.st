initialization
initialize
	super initialize.
	
	self layout: BlFitLayout new.
	self constraintsDo: [ :c |
		c horizontal fitContent.
		c vertical fitContent ].
	self clipChildren: false.
	dragHandler := SGDragHandler new.
	dragHandler shapeElement: self.