mouse handlers
clickEvent: anEvent
	|aPoint|
aPoint := anEvent currentTarget.
(self isSelected: aPoint) ifTrue:[
		self deselect: aPoint.
	] ifFalse:[
		self select: aPoint.
	].
anEvent consumed: true.