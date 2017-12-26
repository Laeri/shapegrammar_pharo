updating
update
|tmpP1 tmpP2|
	ruleDelta := SGShapeDelta new.
	movedVertices := OrderedCollection new.
	"If a vertex was removed update the alphaToBeta, the entry of all alpha points to beta points
	should be removed as well.
	"
	alphaToBeta keysAndValuesRemove: [:alphaP :betaP|
		((beta points includes: betaP) not) or: ((alpha points includes: alphaP) not).
		  ].
	
	"See which vertices are moved around"
	alphaToBeta keysAndValuesDo: [ :alphaP :betaP|
		(alphaP closeTo: betaP precision: SGMatchSelector equalityRange) ifFalse:[movedVertices add: betaP].
		 ].
	betaToAlpha := Dictionary new.
	alphaToBeta keysAndValuesDo: [ :key :value | betaToAlpha at: value put: key ].
	
	"Store Removed Vertices"
	"All points which have a mapping from alpha -> beta are still present, so reject those"
	self removedPoints:( alpha points
		reject: [ :point | self alphaToBeta keys includes: point ]).
	"Store Removed lines"
	alpha
		uniquePairsIn: alpha points
		do: [ :p1 :p2 | 
			((self removedPoints includes: p1) or: (self removedPoints includes: p2))
				ifTrue: [ 
					(alpha isPoint: p1 connectedTo: p2) ifTrue:[
					self removedLines add: (alpha getLineFrom: p1 to: p2)
					].
					 ]
				ifFalse:
					[ tmpP1 := alphaToBeta  at: p1.	"Otherwise check whether p1, p2 in beta shape are not connected"
					tmpP2 := alphaToBeta  at: p2.
					(alpha isPoint: p1 connectedTo: p2)
						ifTrue: [ (beta isPoint: tmpP1 connectedTo: tmpP2)
								ifFalse: [ self removedLines add: (alpha getLineFrom: p1 to: p2) ] ] ] ].

	"Store Added vertices"
	self addedPoints
		addAll: (beta points reject: [ :toPoint | alphaToBeta values includes: toPoint ]).
	"Store added lines"
	beta lines
		do: [ :toLine | 
			tmpP1 := betaToAlpha at: toLine from ifAbsent: nil.
			tmpP2 := betaToAlpha at: toLine to ifAbsent: nil.
			(tmpP1 isNil or: tmpP2 isNil)
				ifTrue: [ self addedLines add: toLine ]
				ifFalse: [ (alpha isPoint: tmpP1 connectedTo: tmpP2)
						ifFalse: [ self addedLines add: toLine ] ] ].
