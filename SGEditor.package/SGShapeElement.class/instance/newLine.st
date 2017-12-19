instance creation
newLine
	^ BlLineElement new
		constraintsDo: [ :c | c ignoreByLayout ];
		border: (BlBorder paint: (Color gray alpha: 0.5) width: 5)