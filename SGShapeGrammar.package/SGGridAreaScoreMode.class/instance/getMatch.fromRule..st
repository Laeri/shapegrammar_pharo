as yet unclassified
getMatch: matches fromRule: rule
bestMatch := matches first.
matches do:[:match|
	self storeMatchIfBest: match fromRule: rule.
].
gridValues increaseScoresBy: 10.
gridValues resetScoresFrom: bestMatch byPoints: rule addedVertices .
^ self bestMatch .