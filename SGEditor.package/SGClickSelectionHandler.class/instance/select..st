select / deselect
select: aPoint
aPoint background: self selectedColor.
firstSelected ifNil: [ firstSelected := aPoint ] ifNotNil:[
	secondSelected ifNil: [ 
			secondSelected := aPoint.
		 ] ifNotNil:[
			self deselect: firstSelected .
			secondSelected := aPoint.
		].
	].