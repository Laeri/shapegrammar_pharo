initialization
newLine
	^ BlLineElement new
		"border: (BlBorder paint: (Color gray alpha: 0.5) width: 5)"
		border: (BlBorder paint: (self lineColor) width: 5)