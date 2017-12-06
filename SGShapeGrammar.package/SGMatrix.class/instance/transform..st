as yet unclassified
transform: vec
	| x y z |
	x := (self atRow: 1) dot: vec.
	y := (self atRow: 2) dot: vec.
	z := (self atRow: 3) dot: vec.
	vec x: x y: y z: z.