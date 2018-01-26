accessing
point: val
	| id position usedIndex |
	(val isKindOf: Association)
		ifTrue: [ "val has the form <id> -> (x@y)"
			id := val key.
			position := val value.
			(self hasPointAtPos: position)
				ifTrue: [ self error: 'tried to add point twice at position: ' , position asString ].
			idToPoints at: id put: (SGVector fromPoint: position).
			^ id ]
		ifFalse: [ "val has the form (x@y) without an id"
			position := val.
			usedIndex := currentIdIndex.
			(self hasPointAtPos: position)
				ifTrue: [ self error: 'tried to add point twice at position: ' , position asString ].
			idToPoints at: usedIndex put: (SGVector fromPoint: position).
			currentIdIndex := currentIdIndex + 1.
			^ usedIndex ]