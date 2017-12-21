accessing
shape: aSGShape

	shape := aSGShape.
	shape when: SGShapeLineRemoved send: #onLineRemoved: to: self.
	shape when: SGShapePointRemoved send: #onPointRemoved: to: self.
	shape when: SGShapeLineAdded send: #onLineAdded: to: self.
	shape when: SGShapePointAdded send: #onPointAdded: to: self.
	shape when: SGShapePointMoved send: #onPointMoved: to: self.
	self initializeShape