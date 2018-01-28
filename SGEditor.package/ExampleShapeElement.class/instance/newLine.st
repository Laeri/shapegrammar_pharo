initialization
newLine
	^ BlLineElement new
		"border: (BlBorder paint: (Color gray alpha: 0.5) width: 5)"
		border: (BlBorder paint: (self lineColour) width: (self lineWidth))