instance creation
p1: p1 p2: p2 p3: p3
|x y t|
x := p2 - p1.
y := p3 - p1.
t := SGVector x: p1 x y: p1 y z: 1.
^ self x: x y: y t: t.