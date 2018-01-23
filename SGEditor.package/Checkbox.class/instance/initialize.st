initialization
initialize
	super initialize.
	self setState: false.
	self addEventHandlerOn: BlClickEvent do: [ :e | self toggleState ].