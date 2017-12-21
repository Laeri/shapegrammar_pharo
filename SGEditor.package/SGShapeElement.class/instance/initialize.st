initialization
initialize
	super initialize.
	
	self layout: BlFitShapeLayout new.
	self constraintsDo: [ :c |
		c horizontal matchParent.
		c vertical matchParent ].
	self clipChildren: false.
	dragHandler := SGDragHandler new.
	dragHandler shapeElement: self.
self addEventHandlerOn: BlClickEvent  do: [:anEvent|
		|aSGVector clickPos|
		 clickPos := (anEvent currentTarget globalPointToLocal: anEvent position).
		aSGVector := SGVector x: clickPos x / self boundingSize y: clickPos y / self boundingSize.
		shape addPoint: aSGVector.
	  ]. 