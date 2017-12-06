convenience
linesDoMatch: lines with: other
	^ lines allSatisfy: [ :line | other lines contains: line ]