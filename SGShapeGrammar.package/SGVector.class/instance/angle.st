accessing
angle
|length theta|
length := self length.
theta := (self x / length) arcCos.
self y > 0 ifTrue:[
	^ theta
	] ifFalse:[
		^ Float twoPi - theta.
	].