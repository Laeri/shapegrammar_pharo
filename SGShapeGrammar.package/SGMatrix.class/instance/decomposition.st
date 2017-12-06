as yet unclassified
decomposition
	| transf translX translY scaleX scaleY rot |
	transf := SGTransformation new.

	"Matrix decomposition"
	translX := self at: 1 at: 3.
	translY := self at: 2 at: 3.
	scaleX := ((self at: 1 at: 1) squared + (self at: 1 at: 2) squared) sqrt.
	scaleY := ((self at: 2 at: 1) squared + (self at: 2 at: 2) squared) sqrt.
	scaleX isZero
		ifTrue: [ self error: 'Scaling x is zero' ].
	scaleY isZero
		ifTrue: [ self error: 'Scaling y is zero' ].
	rot := ((self at: 1 at: 1) / scaleX) arcCos.
	transf
		rot: rot;
		scaleX: scaleX;
		scaleY: scaleY;
		translX: translX;
		translY: translY.
	^ transf