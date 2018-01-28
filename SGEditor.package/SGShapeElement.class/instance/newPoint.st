instance creation
newPoint
	^ BlElement new
		geometry: BlEllipse new;
		size: (self pointRadius)@(self pointRadius);
		background: (self pointColour)