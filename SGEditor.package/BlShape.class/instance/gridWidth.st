as yet unclassified
gridWidth
| min |
useUniformGrid ifTrue:[
		min := self extent min.
		^ (min /gridX).
	] ifFalse:[
^ (self extent x / gridX).
].
