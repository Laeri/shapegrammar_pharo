initialization
initialize
	super initialize.
	
	alphaToBaseLabels := Dictionary new.
	alphaToBase := Dictionary new.
	lineMatch := Dictionary new.
	baseToLocalMatrix := SGMatrix new.
	subToLocalTransform := SGMatrix new.
	betaToBase := Dictionary new.
	coordinates := SGCoordinateSystem new