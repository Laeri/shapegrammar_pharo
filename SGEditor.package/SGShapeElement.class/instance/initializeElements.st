initialization
initializeElements
	| thePoints theLines |

	thePoints := (self shape points collect: [ :aSGVector |
		| aPointElement |
		aPointElement := self newPoint relocate: (aSGVector x @ aSGVector y) * self boundingSize.
		aSGVector -> aPointElement ]) asDictionary.

	theLines := self shape lines collect: [ :aSGLine |		
		self newLine
			fromAnchor: (BlElementCenterAnchor element: (thePoints at: aSGLine from));
			toAnchor: (BlElementCenterAnchor element: (thePoints at: aSGLine to)) ].

	self removeChildren.
	self addChildren: thePoints values, theLines