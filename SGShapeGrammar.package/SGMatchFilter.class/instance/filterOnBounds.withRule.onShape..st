as yet unclassified
filterOnBounds: matches withRule: aRule onShape: aShape
	| tmpP allOutside someOutside |
	filterAllOutside := true.
	filterSomeOutside := false.
	(bounds isNotNil and: (filterAllOutside or: filterSomeOutside))
		ifTrue: [ ^ matches
				reject: [ :aMatch | 
					allOutside := true.
					someOutside := false.
					aMatch beta points
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