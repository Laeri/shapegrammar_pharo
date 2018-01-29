filters
filterOnBounds: matches inShape: aShape
	| tmpP allOutside someOutside |
	filterAllOutside := false.
	filterSomeOutside := true.
	^ matches
		reject: [ :aMatch | 
			allOutside := true.
			someOutside := false.
			self rule beta points
				do: [ :betaP | 
					tmpP := betaP deepCopy.
					aMatch subToLocalMatrix transform: tmpP.
					aMatch localToBaseMatrix transform: tmpP.
					(bounds inside: tmpP)
						ifTrue: [ allOutside := false ]
						ifFalse: [ someOutside := true ] ].
			filterAllOutside
				ifTrue: [ allOutside ]
				ifFalse: [ someOutside ] ]