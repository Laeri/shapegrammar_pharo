accessing
shape: aShape
	
	shape := aShape.
	shape when: SGShapeLineRemoved send: #onLineRemoved: to: self.
	shape when: SGShapePointRemoved send: #onPointRemoved: to: self.

	self initializeElements