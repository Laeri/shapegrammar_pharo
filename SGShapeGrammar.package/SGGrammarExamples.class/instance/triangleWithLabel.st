base shapes
triangleWithLabel
<gtExample>
	| points lines shape pa pb pc label |
	points := OrderedCollection new.
	lines := OrderedCollection new.
	pa :=(SGVector x: 0 y: 0 z: 1).
	pb :=(SGVector x: 0.9 y: 0 z: 1).
	pc :=(SGVector x: 0.9 y: 0.9 z: 1).
	points add: pa.
	points add:pb.
	points add: pc.
	label := SGPolygonLabel new.
	label color: (Color red).
	label polygonPoints add: pa;add: pb; add: pc.
	lines add: (SGLine from: (points at: 1) to: (points at: 2)).
	lines add: (SGLine from: (points at: 2) to: (points at: 3)).
	lines add: (SGLine from: (points at: 1) to: (points at: 3)).
	shape := SGShape points: points lines: lines.
	shape addLabel: label.
	^ shape