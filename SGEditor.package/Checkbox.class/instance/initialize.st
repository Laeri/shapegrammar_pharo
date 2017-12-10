initialization
initialize
super initialize .
self setState: false.
self addEventHandlerOn: BlClickEvent do:[:e|
	self toggleState .
	self invalidate.
	].

text := BrRopedText string: ''.
textElement := BlTextElement new.
textElement text: text.
self addChild: textElement.