SquareInlayGrammar
squareRule
	<gtExample>
	| points lines pointMap pointsR1 linesR1 pointsR2 linesR2 rule |
	points := OrderedCollection new.
	lines := OrderedCollection new.
	pointMap := Dictionary new.
	points add: (SGVector x: 0 y: 0 z: 1).
	points add: (SGVector x: 1 y: 0 z: 1).
	points add: (SGVector x: 0 y: 1 z: 1).
	points add: (SGVector x: 1 y: 1 z: 1).
	lines add: (SGLine from: (points at: 1) to: (points at: 2)).
	lines add: (SGLine from: (points at: 1) to: (points at: 3)).
	lines add: (SGLine from: (points at: 4) to: (points at: 2)).
	lines add: (SGLine from: (points at: 4) to: (points at: 3)).
	pointsR1 := OrderedCollection new.
	linesR1 := OrderedCollection new.
	pointsR1 add: (SGVector x: 0 y: 0 z: 1).
	pointsR1 add: (SGVector x: 1 y: 0 z: 1).
	pointsR1 add: (SGVector x: 0 y: 1 z: 1).
	pointsR1 add: (SGVector x: 1 y: 1 z: 1).
	linesR1 add: (SGLine from: (pointsR1 at: 1) to: (pointsR1 at: 2)).
	linesR1 add: (SGLine from: (pointsR1 at: 1) to: (pointsR1 at: 3)).
	linesR1 add: (SGLine from: (pointsR1 at: 4) to: (pointsR1 at: 2)).
	linesR1 add: (SGLine from: (pointsR1 at: 4) to: (pointsR1 at: 3)).
	pointsR2 := OrderedCollection new.
	linesR2 := OrderedCollection new.
	pointsR2 add: (SGVector x: 0 y: 0 z: 1).
	pointsR2 add: (SGVector x: 1 y: 0 z: 1).
	pointsR2 add: (SGVector x: 0 y: 1 z: 1).
	pointsR2 add: (SGVector x: 1 y: 1 z: 1).
	pointsR2 add: (SGVector x: 0.5 y: 0 z: 1).
	pointsR2 add: (SGVector x: 0 y: 0.5 z: 1).
	pointsR2 add: (SGVector x: 0.5 y: 0.5 z: 1).
	pointsR2 add: (SGVector x: 1 y: 0.5 z: 1).
	pointsR2 add: (SGVector x: 0.5 y: 1 z: 1).
	linesR2 add: (SGLine from: (pointsR2 at: 1) to: (pointsR2 at: 5)).
	linesR2 add: (SGLine from: (pointsR2 at: 5) to: (pointsR2 at: 2)).
	linesR2 add: (SGLine from: (pointsR2 at: 6) to: (pointsR2 at: 7)).
	linesR2 add: (SGLine from: (pointsR2 at: 7) to: (pointsR2 at: 8)).
	linesR2 add: (SGLine from: (pointsR2 at: 3) to: (pointsR2 at: 9)).
	linesR2 add: (SGLine from: (pointsR2 at: 9) to: (pointsR2 at: 4)).
	linesR2 add: (SGLine from: (pointsR2 at: 1) to: (pointsR2 at: 6)).
	linesR2 add: (SGLine from: (pointsR2 at: 6) to: (pointsR2 at: 3)).
	linesR2 add: (SGLine from: (pointsR2 at: 5) to: (pointsR2 at: 7)).
	linesR2 add: (SGLine from: (pointsR2 at: 7) to: (pointsR2 at: 9)).
	linesR2 add: (SGLine from: (pointsR2 at: 2) to: (pointsR2 at: 8)).
	linesR2 add: (SGLine from: (pointsR2 at: 8) to: (pointsR2 at: 4)).
	1 to: 4 do: [ :i | pointMap at: (pointsR1 at: i) put: (pointsR2 at: i) ].
	rule := SGRule
		fromShape: (SGShape points: pointsR1 lines: linesR1)
		toShape: (SGShape points: pointsR2 lines: linesR2)
		mapping: pointMap.
	rule alphaToBeta: pointMap.
	^ rule