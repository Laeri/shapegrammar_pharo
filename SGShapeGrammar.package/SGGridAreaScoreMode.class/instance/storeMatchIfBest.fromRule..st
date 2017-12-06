accessing
storeMatchIfBest: match fromRule: rule
	| x y score totalScore |
	totalScore := 0.
	"match betaToBase
		keysDo: [ :key | 
			match subToLocalMatrix transformTmp: key.
			match baseToLocalMatrix getInv transformTmp: key.
			x := key xTmp.
			y := key yTmp.
			score := gridValues getScoreAt: x and: y.
			totalScore := totalScore + score ].
	totalScore > bestScore
		ifFalse: [ ^ self ].
	bestScore := totalScore.
	bestMatch := match"
	rule addedVertices
		do: [ :newP | 
			match subToLocalMatrix transformTmp: newP.
			match baseToLocalMatrix getInv transformTmp: newP.
			x := newP xTmp.
			y := newP yTmp.
			score := gridValues getScoreAt: x and: y.
			totalScore := totalScore + score ].
	totalScore > bestScore
		ifFalse: [ ^ self ].
	bestScore := totalScore.
	bestMatch := match