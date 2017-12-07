filtering
filterAlreadyPresentMatchesFrom: matchings withShape: shape andRule: rule
	| usableRules shouldReject localToBaseMatrix subToLocalMatrix fromBetaToBase tmpPoints |
	"or if any vertex is already present"
	usableRules := matchings
		reject: [ :match | 
			shouldReject := false.
			localToBaseMatrix := match baseToLocalMatrix getInv.
			subToLocalMatrix := match subToLocalMatrix.
			fromBetaToBase := Dictionary new.
			rule alphaToBeta keysAndValuesDo: [ :key :value | fromBetaToBase at: value put: (match alphaToBase at: key) ].
			match betaToBase: fromBetaToBase.
			tmpPoints := rule addedVertices deepCopy.
			subToLocalMatrix transformAll: tmpPoints.
			localToBaseMatrix transformAll: tmpPoints.
			tmpPoints anySatisfy: [ :tmpPoint | shape points anySatisfy: [ :baseP | baseP x = tmpPoint x and: baseP y = tmpPoint y ] ] ].
	^ usableRules