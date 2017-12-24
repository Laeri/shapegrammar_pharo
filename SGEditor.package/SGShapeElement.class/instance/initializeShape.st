initialization
initializeShape
	| thePoints theLines |

	thePoints := (self shape points collect: [ :aSGVector |
		aSGVector -> (self createPoint: aSGVector) ]) asDictionary.

	theLines := self shape lines collect: [ :aSGLine |
		(self createLine: aSGLine)
			fromAnchor: (BlElementCenterAnchor element: (thePoints at: aSGLine from));
			toAnchor: (BlElementCenterAnchor element: (thePoints at: aSGLine to)) ].
	self removeChildren.
	self addChildren: thePoints values, theLines.
	