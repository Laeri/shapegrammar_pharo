update
selectNew: pSelected
	(secondSelectedPoint = pSelected)
		ifTrue: [ self ifSelectedUnselect: pSelected. ^ nil ]
		ifFalse: [ "switch places if firstSelectedPoint is again selected"
			firstSelectedPoint = pSelected
				ifTrue: [ self ifSelectedUnselect: pSelected .
					^ nil ] ].
	firstSelectedPoint
		ifNil: [ firstSelectedPoint := pSelected ]
		ifNotNil: [ secondSelectedPoint isNil
				ifTrue: [ secondSelectedPoint := pSelected ]
				ifFalse: [ firstSelectedPoint := secondSelectedPoint.
					secondSelectedPoint := pSelected ] ]