arithmetic
* aMatrix
	| tmp |
	tmp := self deepCopy.
	tmp mul: aMatrix.
	^ tmp