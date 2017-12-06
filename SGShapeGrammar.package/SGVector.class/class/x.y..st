instance creation
x: valX y: valY
	| tmp |

	tmp := SGVector new.
	tmp
		x: valX;
		y: valY;
		z: 1.
		^ tmp