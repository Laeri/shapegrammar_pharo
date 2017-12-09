accessing
length
	| l |
	l := self to - self from.
	l := (l x * l x + (l y * l y)) sqrt.
	^ l