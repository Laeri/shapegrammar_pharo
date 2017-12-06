instance creation
x: xVec y: yVec t: translVec
	| mat |
	mat := SGMatrix new.
	mat
		atColumn: 1 put: xVec;
		atColumn: 2 put: yVec;
		atColumn: 3 put: translVec.
	^ mat