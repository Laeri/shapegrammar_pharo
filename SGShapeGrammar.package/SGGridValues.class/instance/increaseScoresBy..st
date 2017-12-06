operations
increaseScoresBy: val
	1 to: numberOfBins do:
		[ :i | 1 to: numberOfBins do: [ :j | (values at: i) at: j put: ((values at: i) at: j) + 1 ] ]