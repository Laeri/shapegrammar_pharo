utility
degreeOf: aPoint
	^ lines count: [ :line | line from = aPoint or: line to = aPoint ]