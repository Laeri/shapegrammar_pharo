accessing
initializeShape
	| thePoints theLines min max transl scale transf fittedPoints middle |
	min := SGVector x: 1000000000000000 y: 11000000000000000.
	max := SGVector x: min x negated y: min y negated.
	self shape points
		do: [ :aSGVector | 
			aSGVector x < min x
				ifTrue: [ min x: aSGVector x ].
			aSGVector x > max x
				ifTrue: [ max x: aSGVector x ].
			aSGVector y < min y
				ifTrue: [ min y: aSGVector y ].
			aSGVector y > max y
				ifTrue: [ max y: aSGVector y ] ].
	middle := ((max x + min x) / 2) @ ((max y + min y) / 2).
	transl := ((middle x - (self boundingSize /2)) negated)@((middle y - (self boundingSize /2))negated).
	scale := (self boundingSize / (max x - min x)) @ (self boundingSize / (max y - min y)).
	transf := SGMatrix identity.
	transf at: 1 at: 1 put: scale x.
	transf at: 2 at: 2 put: scale y.
	transf at: 1 at: 3 put: transl x.
	transf at: 2 at: 3 put: transl y.
	fittedPoints := Dictionary new.
	shape points
		do: [ :aSGVector | 
			| copyVector |
			copyVector := aSGVector deepCopy.
			transf transform: copyVector.
			fittedPoints at: aSGVector put: copyVector ].
	thePoints := (self shape points
		collect: [ :aSGVector | aSGVector -> (self createPoint: (fittedPoints at: aSGVector)) ])
		asDictionary.
	theLines := self shape lines
		collect: [ :aSGLine | 
			(self createLine: aSGLine)
				fromAnchor: (BlElementCenterAnchor element: (thePoints at: aSGLine from));
				toAnchor: (BlElementCenterAnchor element: (thePoints at: aSGLine to)) ].
	self removeChildren.
	self addChildren: thePoints values , theLines