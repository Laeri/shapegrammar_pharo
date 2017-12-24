adding / removing
removePoint: aSGVector
|toRemove|
toRemove := (self findPoints: aSGVector).
toRemove do:[:aPoint|
		(clickSelectionHandler isSelected: aPoint ) ifTrue: [ 
				clickSelectionHandler deselect: aPoint.
			 ].
	].
	self removeChildren: toRemove.