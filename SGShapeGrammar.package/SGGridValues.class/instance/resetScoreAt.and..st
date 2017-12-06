accessing
resetScoreAt: x and: y
	| remX remY score |
	self halt.
	remX := x quo: extentX / self numberOfBins.
	remY := y quo: extentY/ self numberOfBins.
	Transcript show: 'Reset scores at:'  ; show: remX; show: ' '; show: remY;cr.
	score := (values at: remX + 1) at: remY + 1 put: 0.