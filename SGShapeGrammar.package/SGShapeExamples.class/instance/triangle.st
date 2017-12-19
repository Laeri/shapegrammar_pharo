instance creation
triangle
	<gtExample>
	| points lines shape |
	
	points := OrderedCollection new.
	lines := OrderedCollection new.
	points add: (SGVector x: 0 y: 0 z: 1).
	points add: (SGVector x: 0.9 y: 0 z: 1).
	points add: (SGVector x: 0.9 y: 0.9 z: 1).
	lines add: (SGLine from: (points at: 1) to: (points at: 2)).
	lines add: (SGLine from: (points at: 2) to: (points at: 3)).
	lines add: (SGLine from: (points at: 1) to: (points at: 3)).
	shape := SGShape points: points lines: lines.

	^ shape