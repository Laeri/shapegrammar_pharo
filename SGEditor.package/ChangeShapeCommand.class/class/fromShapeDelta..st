as yet unclassified
fromShapeDelta: shapeDelta
	| command |

	command := self new.
	command addedPoints: shapeDelta addedPoints .
	command addedLines: shapeDelta addedLines.
	command removedPoints: shapeDelta removedPoints .
	command removedLines: shapeDelta removedLines.
	command newPositionsDict: shapeDelta movePointToDict .
	command shape: shapeDelta shape.
	command labelTransforms: shapeDelta labelTransforms.
	command oldLabels: shapeDelta removedLabels .
	command addedLabels: shapeDelta addedLabels.
	command oldToNewLabels: shapeDelta oldToNewLabels .
	^ command