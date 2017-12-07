adding
addPoint: point
self assert:[
	(self points includes: point) not.
	].

self assert:[
		(self points anySatisfy: [ :pointInShape|
			(pointInShape equalTo: point inRange: SGMode equalityRange)]) not.
	].
self points add: point.