as yet unclassified
nextColor
	| color |
	Transcript show: (colors at: colorIndex).
	color := Color fromString: ((colors at: colorIndex)).
	colorIndex := (colorIndex + 1).
	colorIndex > (colors size) ifTrue:[colorIndex := 1].
	^ color.