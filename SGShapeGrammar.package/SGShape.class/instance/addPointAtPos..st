adding
addPointAtPos: pos
|p|
p := (SGVector x: pos x y:  pos y z: 1).
self addPoint: p.
^ p.