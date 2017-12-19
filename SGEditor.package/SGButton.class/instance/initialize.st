initialization
initialize
	super initialize.

	self background: (Color r: 63 g: 81 b: 181 range: 255);
		geometry: (BlRectangle cornerRadius: 2);
		padding: (BlInsets top: 8 right: 16 bottom: 8 left: 16);
		layout: BlLinearLayout horizontal;
		effect: (BlDropShadowEffect color: (Color black alpha: 0.3) width: 1 offset: 0@2);
		constraintsDo: [ :c |
			c horizontal fitContent.
			c vertical fitContent ].

	textElement := BlTextElement new.
	textElement text: '' asRopedText.
	self addChild: textElement