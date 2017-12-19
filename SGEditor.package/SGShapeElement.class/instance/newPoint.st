instance creation
newPoint
	^ BlElement new
		geometry: BlEllipse new;
		size: 25@25;
		background: (Color gray alpha: 0.5)