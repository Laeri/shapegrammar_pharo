accessing
maxAgeIn: matches fromRule: rule andShape: shape
| maxAge |
maxAge := Dictionary new.
"Use age of creation"
matches do:[:match|
	currentAge := 0.
		match alphaToBase values do:[:point|
			point ageOfCreation > currentAge ifTrue:[currentAge := point ageOfCreation ].
			].
		maxAge at: match put: currentAge .
	].

matches sort: [ :m1 :m2|
			(maxAge at: m1) > (maxAge at: m2)
	 ].
^ matches first.