adding
addPointAtPos: pos
|p|
p := (SGVector x: pos x y:  pos y z: 1).
self assert:[
	(self points anySatisfy: [ :pointInShape|
			(pointInShape x = p x) and: (pointInShape y = p y). 
		 ]) not.
	].
self points add: p .
^ p.