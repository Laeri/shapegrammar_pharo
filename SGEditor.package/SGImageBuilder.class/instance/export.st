preferences
export
	| alphaElement betaElement baseElement fileEnding filePath path match delta stepsSinceApplication |
	alphaElement := SGShapeElement new.
	betaElement := SGShapeElement new.
	baseElement := SGShapeElement new.
	config grammar rules first filter: filter.
	alphaElement size: size.
	betaElement size: size.
	baseElement size: size.
	alphaElement boundingSize: size.
	betaElement boundingSize: size.
	baseElement boundingSize: size.
	alphaElement shape: config grammar rules first alpha.
	betaElement shape: config grammar rules first beta.
	baseElement shape: config shape.
	fileEnding := '.png'.
	filePath := folder , name , '/'.
	filePath asFileReference exists
		ifFalse: [ filePath asFileReference createDirectory ]
		ifTrue: [ filePath asFileReference deleteAll.
			filePath asFileReference createDirectory ].
	path := '' , filePath , name , '_' , 0 printString , fileEnding.
	baseElement updatePositions.
	baseElement asSpartaForm writePNGFileNamed: path.
	path := '' , filePath , name , '_alpha' , fileEnding.
	alphaElement updatePositions.
	alphaElement asSpartaForm writePNGFileNamed: path.
	path := '' , filePath , name , '_beta' , fileEnding.
	betaElement updatePositions.
	betaElement asSpartaForm writePNGFileNamed: path.
	stepsSinceApplication := by.
	from > 1
		ifTrue: [ 1 to: from - 1 do: [ :aStep | 
				path := '' , filePath , name , '_' , aStep printString , fileEnding.
				match := config grammar rules first selectMatchUsedIn: config shape.
				delta := config grammar rules first shapeDeltaFrom: config shape withMatch: match.
				(ChangeShapeCommand fromShapeDelta: delta) do ] ].
	(from to: to)
		do: [ :aStep | 
			path := '' , filePath , name , '_' , aStep printString , fileEnding.
			match := config grammar rules first selectMatchUsedIn: config shape.
			delta := config grammar rules first shapeDeltaFrom: config shape withMatch: match.
			(ChangeShapeCommand fromShapeDelta: delta) do.
			stepsSinceApplication := stepsSinceApplication + 1.
			(stepsSinceApplication >= by or: aStep = to)
				ifTrue: [ baseElement updatePositions.
					baseElement asSpartaForm writePNGFileNamed: path.
					stepsSinceApplication := 0 ] ]