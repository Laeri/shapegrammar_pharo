filtering
getMatch: matches fromRule: rule andShape: shape
| matchToDegree score |
matchToDegree := Dictionary new.

"Choose between alpha and base and choose between minimum degree preferred or maximum degree"
matches do:[:match|
	score := 0.
		match alphaToBase valuesDo: [ :point|
			score := score + (rule fromShape degreeOf: point).
			matchToDegree at: match put: score.
			 ].
	].

matches sort:[:m1 :m2|
		(matchToDegree at: m1) > (matchToDegree at: m2).
	].
^ matches first.