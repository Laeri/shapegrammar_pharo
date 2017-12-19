accessing
text: aString
	| aText |
	
	aText := aString asRopedText.
	aText attributes: {
		BrTextForegroundAttribute paint: Color white.
		BrFontSizeAttribute size: 16.
		BrFontFamilyAttribute named: 'Helvetica'.
		BrFontWeightAttribute thin
	}.
	
	textElement text: aText