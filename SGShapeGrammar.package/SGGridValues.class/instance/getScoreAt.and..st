accessing
getScoreAt: x and: y
	| remX remY score|
	remX := x quo: extentX / self numberOfBins.
	remY := y quo: extentY / self numberOfBins.
	score := (values at: (remX + 1)) at: (remY +1).
	"values at:(remX + 1) at: (remY +1) put: 0."
	^score.