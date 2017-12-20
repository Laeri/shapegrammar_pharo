initialization
initializeMatch

	self findPoints do: [ :anElement | anElement background: self unmatchedPaint ].
	self findLines do: [ :anElement | anElement border: (anElement border copyWithPaint: self unmatchedPaint) ].

	self match alphaToBase valuesDo: [ :aSGVector |
		(self findPoints: aSGVector) do: [ :anElement |
			anElement background: self matchedPaint ] ].

	self match lineMatch valuesDo: [ :aSGLine |
		(self findLines: aSGLine) do: [ :anElement |
			anElement border: (anElement border copyWithPaint: self matchedPaint) ] ].
	
	self hideCoordinates