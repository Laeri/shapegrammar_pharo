accessing
minimumAverageAgeIn: matches fromRule: rule andShape: shape
| minAge |
minAge := Dictionary new.
"Use age of creation"
matches do:[:match|
	|avg|
		avg := match alphaToBase values inject: 0 into: [:sum :aPoint| sum + aPoint ageOfCreation].
		avg := avg / (match alphaToBase values size).	
		minAge at: match put: avg .
	].

matches sort: [ :m1 :m2|
			(minAge at: m1) < (minAge at: m2)
	 ].
^ matches first.