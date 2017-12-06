accessing
point: val
| id position usedIndex|
	(val isKindOf: Association)
		ifTrue: [ id := val key.
			position := val value.
			idToPoints at: id put: (SGVector fromPoint: position). ^ id ]
		ifFalse: [
			position := val.
			usedIndex := currentIdIndex.
			 idToPoints at: usedIndex  put: (SGVector fromPoint: position).
			currentIdIndex := currentIdIndex + 1. ^usedIndex]