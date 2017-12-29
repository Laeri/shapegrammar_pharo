testing
hasPointAtPos: aPosition
	^ idToPoints values
		anySatisfy: [ :aPoint | aPoint x = aPosition x and: aPoint y = aPosition y ]