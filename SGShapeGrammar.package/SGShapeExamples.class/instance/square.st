instance creation
square
	<gtExample>
	| points lines pointMap baseShape |

	points := OrderedCollection new.
	lines := OrderedCollection new.
	pointMap := Dictionary new.
	points add: (SGVector x: 0.1 y: 0.1 z: 1).
	points add: (SGVector x: 0.9 y: 0.1 z: 1).
	points add: (SGVector x: 0.1 y: 0.9 z: 1).
	points add: (SGVector x: 0.9 y: 0.9 z: 1).
	lines add: (SGLine from: (points at: 1) to: (points at: 2)).
	lines add: (SGLine from: (points at: 1) to: (points at: 3)).
	lines add: (SGLine from: (points at: 4) to: (points at: 2)).
	lines add: (SGLine from: (points at: 4) to: (points at: 3)).
	baseShape := SGShape points: points lines: lines.
	
	^ baseShape