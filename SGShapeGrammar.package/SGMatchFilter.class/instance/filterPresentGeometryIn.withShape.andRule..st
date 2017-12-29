filters
filterPresentGeometryIn: matchings withShape: shape andRule: rule
	| usableRules localToBaseMatrix subToLocalMatrix tmpP pointMatchBlock |
	"or if any vertex is already present"
	usableRules := matchings
		reject: [ :aMatch | 
			pointMatchBlock := [ :matchPoint | 
			shape points
				anySatisfy: [ :shapeP | 
					tmpP := SGVector x: matchPoint x y: matchPoint y.
					subToLocalMatrix := aMatch subToLocalMatrix.
					localToBaseMatrix := aMatch baseToLocalMatrix getInv.
					subToLocalMatrix transform: tmpP.
					localToBaseMatrix transform: tmpP.
					tmpP closeTo: shapeP precision: SGMatchSelector equalityRange ] ].
			anyPresentGeometry
				ifTrue: [ (rule addedPoints anySatisfy: pointMatchBlock)
						or: (rule addedLines anySatisfy: [ :addedLine | aMatch lineMatch includesKey: addedLine ]) ]
				ifFalse: [ (rule addedPoints allSatisfy: pointMatchBlock)
						and: (rule addedLines allSatisfy: [ :addedLine | aMatch lineMatch includesKey: addedLine ]) ] ].
	^ usableRules