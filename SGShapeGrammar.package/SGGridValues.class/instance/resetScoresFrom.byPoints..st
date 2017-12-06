as yet unclassified
resetScoresFrom: match byPoints: points

points do: [ :key|
		self resetScoreAt: key xTmp and: key yTmp.	
	 ].