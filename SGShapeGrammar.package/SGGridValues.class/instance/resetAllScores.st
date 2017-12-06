operations
resetAllScores

values do:[:bin |
	bin doWithIndex:[:val :i | bin at: i put: 0].
].