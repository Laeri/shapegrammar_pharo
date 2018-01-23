filtering
getMatchFrom: matches andShape: shape
bestMatch := matches first.
matches do:[:match|
	self storeMatchIfBest: match fromRule: rule.
].
gridValues increaseScoresBy: 10.
gridValues resetScoresFrom: bestMatch byPoints: rule addedPoints .
^ self bestMatch .