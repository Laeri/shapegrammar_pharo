dnd handlers
dragEndEvent: anEvent
	| dragEndPosition |
	dragEndPosition := anEvent currentTarget globalPointToParent: anEvent position.
	