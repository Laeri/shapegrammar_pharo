accessing
findPointWith: aPosition
^ idToPoints values detect: [:aValue|
		((aValue x = aPosition x) and: (aValue y = aPosition y))
	 ] ifNone: [ 
		^ idToPoints at: (self point: aPosition).
	].