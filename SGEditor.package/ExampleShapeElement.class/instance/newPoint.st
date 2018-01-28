initialization
newPoint
	^ BlElement new
		geometry: BlEllipse new;
		size: (self pointSize @ self pointSize);
		background: (self pointColour)