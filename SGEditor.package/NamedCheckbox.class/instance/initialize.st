initialization
initialize
	super initialize.

	self layout: BlLinearLayout horizontal.
	
	box := Checkbox new.
	box size: 25@25.
	
	text := BrRopedText string: ''.
	textElement := BlTextElement new.
	textElement text: text.
	
	self addChild: textElement.
	self addChild: box.
	
	self constraintsDo: [:c |
		c horizontal fitContent.
		c vertical fitContent ]