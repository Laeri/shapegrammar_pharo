match calculation
shapeDeltaFromShape: shape GivenMatch: matchUsed
	| tmpP1 tmpP2 tmpP subToLocalMatrix fromBetaToBase transf localToBaseMatrix baseToLocalMatrix shapeChangeDelta lineToRemove removedLinesInBase blMatrix blDecomposition |
	shapeChangeDelta := SGShapeChange new.
	mode increaseAge .
	
	self update.
	"Do custom tagging on shape or some other calculations based on the mode"
	mode applyModeOnShape: shape withUsedMatch: matchUsed.
	fromBetaToBase := matchUsed betaToBase.
	localToBaseMatrix := matchUsed baseToLocalMatrix.
	baseToLocalMatrix := localToBaseMatrix deepCopy.
	localToBaseMatrix invert.
	subToLocalMatrix := matchUsed subToLocalMatrix.

	"Add and remove Vertices/Lines"
	removedLinesInBase := OrderedCollection new.
	"Remove Lines"
		removedVertices do:[:removedV|
		tmpP := (matchUsed alphaToBase at: removedV).
		removedLinesInBase addAll: (shape allLinesFromOrTo: tmpP).
		].
	removedLines
		do: [ :removedLine | 
			tmpP1 := matchUsed alphaToBase at: removedLine from.
			tmpP2 := matchUsed alphaToBase at: removedLine to.
			lineToRemove := shape getLineFrom: tmpP1 to: tmpP2.
			removedLinesInBase addIfNotPresent: lineToRemove .
			 ].
		removedLinesInBase do:[:removedLine|
				shapeChangeDelta removeLine: removedLine.
			].

		

	"Remove Vertices"
	removedVertices
		do: [ :removed | shapeChangeDelta removeVertex: (matchUsed alphaToBase at: removed) ].
	transf := baseToLocalMatrix decomposition.
	blMatrix := BlMatrix2D new.
	blMatrix sx: (baseToLocalMatrix at: 1 at: 1).
	blMatrix sy: (baseToLocalMatrix at: 2 at: 2).
	blMatrix shx: (baseToLocalMatrix at: 1 at: 2).
	blMatrix shy: (baseToLocalMatrix at: 2 at: 2).
	blDecomposition := blMatrix decomposition .
	self halt.
	"If point in base which is in beta changed coords change it in base"
	movedVertices do:[:movedPoint|
		tmpP := movedPoint deepCopy.
		subToLocalMatrix transform: tmpP.
		localToBaseMatrix transform: tmpP.
		shapeChangeDelta movePoint: (matchUsed betaToBase at: movedPoint) toPosition: tmpP. 
		].
	
	"Add vertices"
	addedVertices
		do: [ :pAdded | 
			tmpP := SGVector new.
			fromBetaToBase at: pAdded put: tmpP.	"new added points are also mapped to from beta points"
			tmpP x: pAdded x.
			tmpP y: pAdded y.
			tmpP z: 1.
			subToLocalMatrix transform: tmpP.
			localToBaseMatrix transform: tmpP.
			tmpP ageOfCreation: mode currentAge .
			shapeChangeDelta addVertex: tmpP ].

	"Then finally add the new lines"
	"self halt."
	addedLines
		do: [ :addedLine | 
			tmpP1 := fromBetaToBase at: addedLine from.
			tmpP2 := fromBetaToBase at: addedLine to.
			shapeChangeDelta addLine: (SGLine from: tmpP1 to: tmpP2) ].

	shapeChangeDelta shape: shape.

	^ shapeChangeDelta .