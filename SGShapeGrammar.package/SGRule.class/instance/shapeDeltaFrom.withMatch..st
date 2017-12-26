match calculation
shapeDeltaFrom: shape withMatch: matchUsed
	| tmpP1 tmpP2 tmpP subToLocalMatrix fromBetaToBase localToBaseMatrix baseToLocalMatrix tmpDelta lineToRemove newBaseLabel basePolygonPoints newLabels |
	tmpDelta := SGShapeDelta new.
	matchSelector increaseAge.
	self update.

	"Do custom tagging on shape or some other calculations based on the match selector"
	matchSelector applyModeOnShape: shape withUsedMatch: matchUsed.
	
	fromBetaToBase := matchUsed betaToBase.
	localToBaseMatrix := matchUsed baseToLocalMatrix.
	baseToLocalMatrix := localToBaseMatrix deepCopy.
	localToBaseMatrix invert.
	subToLocalMatrix := matchUsed subToLocalMatrix.

	"Add and remove Vertices/Lines"

	"Remove Lines"

	self removedLines
		do: [ :removedLine | 
			"tmpP1 := matchUsed alphaToBase at: removedLine from.
			tmpP2 := matchUsed alphaToBase at: removedLine to.
			lineToRemove := shape getLineFrom: tmpP1 to: tmpP2."
			lineToRemove := matchUsed lineMatch at: removedLine.
			tmpDelta removeLine: lineToRemove ].

	"Remove Vertices"
	self removedPoints
		do: [ :removed | tmpDelta removePoint: (matchUsed alphaToBase at: removed) ].
	"If point in base which is in beta changed coords change it in base"
	movedVertices
		do: [ :movedPoint | 
			tmpP := movedPoint deepCopy.
			subToLocalMatrix transform: tmpP.
			localToBaseMatrix transform: tmpP.
			tmpDelta movePoint: (matchUsed betaToBase at: movedPoint) toPosition: tmpP ].

	"Add vertices"
	self addedPoints
		do: [ :pAdded |
			(matchUsed betaToBase includesKey: pAdded) ifTrue:[Transcript show: 'New point already in base shape'; cr.
				"Reuse points which should be added but are already there"
				
				] ifFalse: [  
			tmpP := SGVector new.
			fromBetaToBase at: pAdded put: tmpP.	"new added points are also mapped to from beta points"
			tmpP x: pAdded x.
			tmpP y: pAdded y.
			tmpP z: 1.
			subToLocalMatrix transform: tmpP.
			localToBaseMatrix transform: tmpP.
			tmpP ageOfCreation: matchSelector currentAge.
			tmpDelta addPoint: tmpP] ].

	"Then finally add the new lines"
	"self halt."
	self addedLines
		do: [ :addedLine | 
			|newLine|
			"Only add line if it is not already present in the base shape"
			(matchUsed lineMatch includes: addedLine) ifFalse:[
			tmpP1 := fromBetaToBase at: addedLine from.
			tmpP2 := fromBetaToBase at: addedLine to.
			newLine := (SGLine from: tmpP1 to: tmpP2).
			(shape hasLine: (newLine)) ifTrue: [ ] ifFalse:[
			tmpDelta addLine: newLine]].].
	tmpDelta shape: shape.


	"Figure out removed labels (label in shape which is in alpha)"
	"Figure out added labels (label in beta which are added to base)"
	tmpDelta labelTransforms: self labelTransforms.
	tmpDelta removedLabels addAll: matchUsed alphaToBaseLabels values.
	self beta labels
		do: [ :betaLabel | 
			newBaseLabel := SGPolygonLabel new.
			newBaseLabel id: (betaLabel id).
			basePolygonPoints := OrderedCollection new.
			betaLabel polygonPoints
				do: [ :polygonPoint | basePolygonPoints add: (fromBetaToBase at: polygonPoint) ].
			newBaseLabel polygonPoints: basePolygonPoints.
			tmpDelta addLabel: newBaseLabel.
			self alphaToBetaLabels keysAndValuesDo: [ :oldLabelAlpha :mappedLabelsBeta|
					(mappedLabelsBeta includes: betaLabel) ifTrue:[
							newLabels := tmpDelta oldToNewLabels at: (matchUsed alphaToBaseLabels at: oldLabelAlpha ) ifAbsent:[OrderedCollection new].
							newLabels add: newBaseLabel .
							tmpDelta oldToNewLabels at:(matchUsed alphaToBaseLabels at: oldLabelAlpha) put: newLabels.
						].
				 ].
			].
		tmpDelta labelTransforms: (self labelTransforms ).
	^ tmpDelta