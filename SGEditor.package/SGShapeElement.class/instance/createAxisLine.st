instance creation
createAxisLine
	| aLine |

	aLine := self newLine.
	aLine userData at: #shapeGrammarAxisLine put: true.
	aLine border: (BlBorder paint: (Color blue alpha: 1) width: 5).
	aLine toHead: (BlArrowheadSimpleArrow new
		arrowLengthFraction: 4;
		arrowNoseAngle: 75;
		border: (BlBorder builder paint: Color blue; width: 4; build);
		background: (Color blue alpha: 1)).
	^ aLine