testing
connects: aPoint with: anotherPoint
	^ (self from = aPoint and: self to = anotherPoint)
		or: (self from = anotherPoint and: self to = aPoint)