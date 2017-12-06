operations
setScoreToPoint: p
	| remX remY score |
	remX := p x quo: extentX / self numberOfBins.
	remY := p y quo: extentY / self numberOfBins.
	score := values at: (remX + 1) at: (remY +1).
	values at:(remX + 1) at: (remY +1) put: 0.
	p areaScore: score.