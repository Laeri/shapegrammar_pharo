initialization
initialize
super initialize .

self addEventHandlerOn: BlMouseDownEvent  do:[:e|
	self toggleState .
	self invalidate.
	].