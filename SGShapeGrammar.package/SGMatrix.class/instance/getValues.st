accessing
getValues
	| values |
	values := OrderedCollection new.
	values
		addAll: (rows at: 1);
		addAll: (rows at: 2);
		addAll: (rows at: 3).
	^ values