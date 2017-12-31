as yet unclassified
startWith: aShape
	| matches |
	initialPoints := aShape points copy.
	oldNodes := aShape points copy.
	useTreeStructure
		ifTrue: [ self halt.
			useTreeStructure := false.
			rule filter reflections: true.
			matches := rule subMatchesOf: rule alpha in: rule beta.
			oldNodes := matches
				collect: [ :aMatch | 
					| shape |
					shape := SGShape new.
					shape points: aMatch alphaToBase values.
					shape ].
			useTreeStructure := true.
			rule filter reflections: false.
			initialPoints removeAll ]