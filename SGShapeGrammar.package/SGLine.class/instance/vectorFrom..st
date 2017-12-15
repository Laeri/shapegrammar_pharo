as yet unclassified
vectorFrom: point
|vector start end|
vector := SGVector new.
point = from ifTrue:[
		start := from.
		end := to. 
	] ifFalse:[
		(point = to) ifTrue:[
				start := to.
				end := from.
			]ifFalse:[self error].
	].
vector x: (end x - start x); y: (end y - start y); z:0.
^ vector.