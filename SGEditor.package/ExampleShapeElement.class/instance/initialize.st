initialization
initialize
super initialize.
self constraintsDo: [ :c| 
	c horizontal matchParent.
	c vertical matchParent.
	].
self size: (self boundingSize @ self boundingSize )