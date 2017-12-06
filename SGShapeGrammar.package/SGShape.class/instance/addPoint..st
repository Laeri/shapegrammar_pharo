adding
addPoint: point
self assert:[
	(self points includes: point) not.
	].

self assert:[
		(self points anySatisfy: [ :pointInShape|
			(pointInShape x = point x) and: (pointInShape y = point y)]) not.
	].
self points add: point.