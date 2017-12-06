initialization
initialize
|text|
super initialize.
text := BrRopedText string: ''.
textElement := BlTextElement new.
textElement text: text.
self addChild: textElement.
