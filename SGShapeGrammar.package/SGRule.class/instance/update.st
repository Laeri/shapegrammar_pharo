updating
update
|tmpP1 tmpP2|
	removedLines := OrderedCollection new.
	removedVertices := OrderedCollection new.
	addedLines := OrderedCollection new.
	addedVertices := OrderedCollection new.
	movedVertices := OrderedCollection new.
	"If a vertex was removed update the alphaToBeta, the entry of all alpha points to beta points
	should be removed as well.
	"
	alphaToBeta keysAndValuesRemove: [:alphaP :betaP|
		((toShape points includes: betaP) not) or: ((fromShape points includes: alphaP) not).
		  ].
	
	"See which vertices are moved around"
	alphaToBeta keysAndValuesDo: [ :alphaP :betaP|
		(alphaP equalTo: betaP inRange: SGMatchSelector equalityRange) ifFalse:[movedVertices add: betaP].
		 ].
	betaToAlpha := Dictionary new.
	alphaToBeta keysAndValuesDo: [ :key :value | betaToAlpha at: value put: key ].
	
	"Store Removed Vertices"
	"All points which have a mapping from alpha -> beta are still present, so reject those"
	removedVertices := fromShape points
		reject: [ :point | self alphaToBeta keys includes: point ].
	"Store Removed lines"
	fromShape
		uniquePairsIn: fromShape points
		do: [ :p1 :p2 | 
			((removedVertices includes: p1) or: (removedVertices includes: p2))
				ifTrue: [ 
					(fromShape isPoint: p1 connectedTo: p2) ifTrue:[
					removedLines add: (fromShape getLineFrom: p1 to: p2)
					].
					 ]
				ifFalse:
					[ tmpP1 := alphaToBeta  at: p1.	"Otherwise check whether p1, p2 in beta shape are not connected"
					tmpP2 := alphaToBeta  at: p2.
					(fromShape isPoint: p1 connectedTo: p2)
						ifTrue: [ (toShape isPoint: tmpP1 connectedTo: tmpP2)
								ifFalse: [ removedLines add: (fromShape getLineFrom: p1 to: p2) ] ] ] ].

	"Store Added vertices"
	addedVertices
		addAll: (toShape points reject: [ :toPoint | alphaToBeta values includes: toPoint ]).
	"Store added lines"
	toShape lines
		do: [ :toLine | 
			tmpP1 := betaToAlpha at: toLine from ifAbsent: nil.
			tmpP2 := betaToAlpha at: toLine to ifAbsent: nil.
			(tmpP1 isNil or: tmpP2 isNil)
				ifTrue: [ addedLines add: toLine ]
				ifFalse: [ (fromShape isPoint: tmpP1 connectedTo: tmpP2)
						ifFalse: [ addedLines add: toLine ] ] ].
