RemovePointFromTriangleGrammar
removePointFromTriangleGrammar
<gtExample>
|   pointMap pointsR1 linesR1 pointsR2 linesR2 rule grammar |
pointMap := Dictionary new.
	pointsR1 := OrderedCollection new.
	linesR1 := OrderedCollection new.
	pointsR1 add: (SGVector x: 0.1 y: 0.1 z: 1).
	pointsR1 add: (SGVector x: 0.9 y: 0.1 z: 1).
	pointsR1 add: (SGVector x: 0.9 y: 0.9 z: 1).
	linesR1 add: (SGLine from: (pointsR1 at: 1) to: (pointsR1 at: 2)).
	linesR1 add: (SGLine from: (pointsR1 at: 2) to: (pointsR1 at: 3)).
	linesR1 add: (SGLine from: (pointsR1 at: 1) to: (pointsR1 at: 3)).
	pointsR2 := OrderedCollection new.
	linesR2 := OrderedCollection new.
	pointsR2 add: (SGVector x: 0.1 y: 0.1 z: 1).
	pointsR2 add: (SGVector x: 0.9 y: 0.1 z: 1).

	linesR2 add: (SGLine from: (pointsR2 at: 1) to: (pointsR2 at: 2)).
	pointMap at: (pointsR1 first) put: (pointsR2 first).
pointMap at: (pointsR1 second ) put: (pointsR2 second).
	rule := SGRule
		fromShape: (SGShape points: pointsR1 lines: linesR1)
		toShape: (SGShape points: pointsR2 lines: linesR2) mapping: pointMap.
	rule alphaToBeta: pointMap.
	
grammar := SGGrammar new.
grammar addRule: rule.
^ grammar.