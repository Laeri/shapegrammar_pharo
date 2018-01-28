initialization
initialize
super initialize.
pointSize := 50.
lineWidth := 5.
lineColour := Color black.
pointColour := Color black.
self constraintsDo: [ :c| 
	c horizontal matchParent.
	c vertical matchParent.
	].
self size: (self boundingSize @ self boundingSize ).
