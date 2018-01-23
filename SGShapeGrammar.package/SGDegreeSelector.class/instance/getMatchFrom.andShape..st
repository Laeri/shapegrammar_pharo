filtering
getMatchFrom: matches andShape: shape
| matchToDegree score maxDegrees |
matchToDegree := Dictionary new.
maxDegrees := Dictionary new.

"Choose between alpha and base and choose between minimum degree preferred or maximum degree"
matches do:[:match|
	score := 0.
		match alphaToBase valuesDo: [ :point|
			|maxScore|
			maxScore := (maxDegrees at: match ifAbsent:[(rule alpha degreeOf: point)]).
			((rule alpha degreeOf: point) >= maxScore ) ifTrue:[maxDegrees at: match put: maxScore].
			score := score + (rule alpha degreeOf: point).
			matchToDegree at: match put: score.
			 ].
	].

"matches sort:[:m1 :m2|
		(matchToDegree at: m1) > (matchToDegree at: m2).
	]."
matches sort: [ :m1 :m2|
			(maxDegrees at: m1) > (maxDegrees at: m2) 
	 ].
^ matches first.