dnd handlers
dragStartEvent: anEvent	
	"drag start position in parent"
	dragStartPosition := anEvent currentTarget globalPointToParent: anEvent position.

	"element position in parent"
	originalPosition := anEvent currentTarget position.

	shapeElement clickSelectionHandler select: (anEvent currentTarget).
	
	anEvent consumed: true
	

	