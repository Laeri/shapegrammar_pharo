as yet unclassified
extractPolygons
|halfEdges headPartitions h1 h2 partition start polygon stop next nextPartitions nextPartition current i |
headPartitions := Dictionary new.
halfEdges := OrderedCollection new.
self lines do:[:line|
	h1 := Association key: line from value: line to.
	h2 := Association key: line to value: line from.
	partition := headPartitions at: (h1 value) ifAbsent:[
		headPartitions at: (h1 value) put: (OrderedCollection new).
		headPartitions at: (h1 value)
		].
	partition add: h1.
	
	partition := headPartitions at: (h2 value) ifAbsent:[
		headPartitions at: (h2 value) put: (OrderedCollection new).
		headPartitions at: (h2 value)
		].
	partition add: h2.
	].

"Sort partitions by angle"
	start := partition first. "start with one direction"
	polygon := SGPolygon new.
	stop := false.
	current := start.
	[ stop ] whileFalse: [
			nextPartition := headPartitions at: current key.
			i := nextPartition indexOf: [:p| p key =   current value and: p value = current key].
			i := (i+1) > nextPartition size ifTrue:[i := 1]ifFalse:[i+1].
			current := nextPartition at: i.
			current = start ifTrue:[stop := true] ifFalse:[polygon addPoint: current].
	   ].
