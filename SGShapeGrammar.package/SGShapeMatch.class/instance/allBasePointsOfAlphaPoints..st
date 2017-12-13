as yet unclassified
allBasePointsOfAlphaPoints: alphaPoints
| points |
points := OrderedCollection new.
alphaToBase keysAndValuesDo: [ :alphaP :baseP|
		(alphaPoints includes: alphaP) ifTrue:[points add: baseP].
	 ].
^ points.