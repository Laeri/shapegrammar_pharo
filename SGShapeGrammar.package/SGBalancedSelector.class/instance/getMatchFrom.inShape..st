filtering
getMatchFrom: matches inShape: shape
	| matchedPoints ageSum matchToAgeSum ageSumToBin chosenAgeBin sameShapeBins chosenShapeBin chosenShapeBins binToAge bins tmpBins |
	
	matchToAgeSum := Dictionary new.
	ageSumToBin := Dictionary new.
	
	matches
		do: [ :match | 
			matchedPoints := match matchedBasePoints.
			ageSum := 0.
			matchedPoints do: [ :p | ageSum := ageSum + (p ageOfCreation). Transcript show: (p ageOfCreation ) ].
			matchToAgeSum at: match put: ageSum.
			ageSumToBin at: ageSum ifAbsent: [ageSumToBin at: ageSum put: OrderedCollection new].
			(ageSumToBin at: ageSum) add: match.
			 ].
		"chosenAgeBin := (self randomElementFrom: ageSumToBin values)."
		binToAge := Dictionary new.
		ageSumToBin keysAndValuesDo: [ :sum : bin| 
				binToAge at: bin put: sum.
			].
		tmpBins := ageSumToBin values.
		tmpBins sort:[:b1 :b2|(binToAge at:b1) < (binToAge at: b2)].
		chosenAgeBin := tmpBins first.
	sameShapeBins := OrderedCollection new.
	chosenAgeBin do:[:match|
		chosenShapeBins := sameShapeBins select: [:binWithSameshapes|
				self arePoints: match matchedBasePoints sameAsIn: binWithSameshapes
			].
		self assert: [ chosenShapeBins size <= 1 ].
		(chosenShapeBins size = 1) ifTrue:[chosenShapeBin := chosenShapeBins first] ifFalse:[chosenShapeBin := OrderedCollection new. sameShapeBins add: chosenShapeBin ].
		chosenShapeBin add: match.
		].
	^ self randomElementFrom: (self randomElementFrom: sameShapeBins )