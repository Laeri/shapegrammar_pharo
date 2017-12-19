notifying
notifyLineRemoved: aSGLine
	self announce: (SGShapeLineRemoved new line: aSGLine)