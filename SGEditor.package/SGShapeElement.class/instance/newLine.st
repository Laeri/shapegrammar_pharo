instance creation
newLine
	^ BlLineElement new
		constraintsDo: [ :c | c ignoreByLayout ];
		border: (BlBorder paint: (self lineColour) width: (self lineWidth ))