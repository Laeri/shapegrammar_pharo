as yet unclassified
gridHeight

| min |
useUniformGrid ifTrue:[
		min := self extent min.
		^ (min /gridY).
	] ifFalse:[
	^ (self extent y / gridY).
].

