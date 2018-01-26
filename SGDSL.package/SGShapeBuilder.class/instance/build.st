accessing
build
shape := SGShape points: (OrderedCollection newFrom:(idToPoints values)) lines: lines.
shape labels: labels deepCopy.
idToPoints keysAndValuesDo: [ :id :aPoint| 
		aPoint data at: #id put: id
	].
^ shape.