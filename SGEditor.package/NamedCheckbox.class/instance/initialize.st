initialization
initialize
super initialize.

self layout: BlLinearLayout horizontal.
box := Checkbox new.
box constraintsDo:[:c|
	c horizontal matchParent.
	c vertical matchParent.
	].
box size: 25@25.
text := BrRopedText string: ''.
textElement := BlTextElement new.
textElement text: text.
textElement constraintsDo:[:c|
	c horizontal matchParent.
	c vertical matchParent.
	].
self addChild: textElement.
self addChild: box.
self constraintsDo:[:c|
	c horizontal matchParent.
	c vertical matchParent.
].