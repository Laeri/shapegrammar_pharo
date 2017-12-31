accessing
rule
	| pointMap |
	pointMap := Dictionary new.
	rule := SGRule fromShape: alpha shape toShape: beta shape.
	automap
		ifTrue: [ rule alpha points
				do: [ :alphaPoint | 
					| matchPoints |
					matchPoints := rule beta points
						select: [ :betaPoint | alphaPoint x = betaPoint x and: alphaPoint y = betaPoint y ].
					matchPoints ifNotEmpty: [ pointMap at: alphaPoint put: matchPoints first ] ] ].
	map
		ifEmpty: [ rule beta points
				ifNotEmpty: [ Transcript show: 'No point mapping specified! in rule builder' ] ].
	map
		keysAndValuesDo:
			[ :alphaId :betaId | pointMap at: (alpha pointOfId: alphaId) put: (beta pointOfId: betaId) ].
	rule alphaToBeta: pointMap.
	rule update.
	^ rule