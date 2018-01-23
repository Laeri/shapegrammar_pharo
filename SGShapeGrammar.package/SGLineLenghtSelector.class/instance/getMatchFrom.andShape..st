filtering
getMatchFrom: matches andShape: shape
	| lines1 lines2 length1 length2 lengths1 lengths2 lengthDiff1 lengthDiff2 |
	"Either do this in alpha shape or to be generated beta shape"
	"Sort based on total length"
""	"matches
		sort: [ :m1 :m2 | 
			lines1 := m1 lineMatch values.
			length1 := 0.
			lines1 do: [ :line | length1 := length1 + line length ].
			lines2 := m2 lineMatch values.
			length2 := 0.
			lines2 do: [ :line | length2 := length2 + line length ].
			length1 > length2 ]."
	"Sort based on minimal line length difference"
	matches
		sort: [ :m1 :m2 | 
			lines1 := m1 lineMatch values.
			lines2 := m2 lineMatch values.
			lengthDiff1 := 0.
			lines1 allPairsDo: [ :l1 :l2 | lengthDiff1 := lengthDiff1 + ((l1 length - l2 length) squared)*(l1 length) ].
			lengthDiff2 := 0.
			lines2 allPairsDo: [ :l1 :l2 | lengthDiff2 := lengthDiff2 + ((l1 length - l2 length) squared) *(l1 length)].
			
			lengthDiff1 < lengthDiff2 ].
	^ matches first