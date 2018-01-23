filters
filterOnBounds: matches withShape: aShape
	| tmpP allOutside someOutside |
	filterAllOutside := false.
	filterSomeOutside := true.
	(bounds isNotNil and: (filterAllOutside or: filterSomeOutside))
		ifTrue: [ ^ matches
				reject: [ :aMatch | 
					allOutside := true.
					someOutside := false.
					(self rule) beta points
						do: [ :betaP | 
							tmpP := betaP deepCopy.
							aMatch subToLocalMatrix transform: tmpP.
							aMatch localToBaseMatrix transform: tmpP.
							(bounds inside: tmpP)
								ifTrue: [ allOutside := false ]
								ifFalse: [ someOutside := true ] ].
							filterAllOutside ifTrue: [ allOutside  ] ifFalse:[
									someOutside 
								].
							
							 ] ]
		ifFalse: [ ^ matches ]