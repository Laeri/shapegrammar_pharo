RecursiveSquareGrammar
recursiveSquareRuleWithLabels
<gtExample>
	| pointMap pointsR1 linesR1 pointsR2 linesR2 rule p1 p2 p3 p4 label p5 p6 p7 p8 label1 label2 label3 label4 label5 |
	pointsR1 := OrderedCollection new.
	linesR1 := OrderedCollection new.
	pointMap := Dictionary new.
	p1 := SGVector x: 0.1 y: 0.1 z: 1.
	p2 := SGVector x: 0.1 y: 0.9 z: 1.
	p3 := SGVector x: 0.9 y: 0.9 z: 1.
	p4 := SGVector x: 0.9 y: 0.1 z: 1.
	label := SGPolygonLabel new.
	label polygon
		addPoint: p1;
		addPoint: p2;
		addPoint: p3;
		addPoint: p4.
	pointsR1 add: p1.
	pointsR1 add: p2.
	pointsR1 add: p3.
	pointsR1 add: p4.
	linesR1 add: (SGLine from: (pointsR1 at: 1) to: (pointsR1 at: 2)).
	linesR1 add: (SGLine from: (pointsR1 at: 2) to: (pointsR1 at: 3)).
	linesR1 add: (SGLine from: (pointsR1 at: 3) to: (pointsR1 at: 4)).
	linesR1 add: (SGLine from: (pointsR1 at: 4) to: (pointsR1 at: 1)).
	pointsR2 := OrderedCollection new.
	linesR2 := OrderedCollection new.
	p1 := SGVector x: 0.1 y: 0.1 z: 1.
	p2 := SGVector x: 0.1 y: 0.9 z: 1.
	p3 := SGVector x: 0.9 y: 0.9 z: 1.
	p4 := SGVector x: 0.9 y: 0.1 z: 1.
	p5 := SGVector x: 0.1 y: 0.18 z: 1.
	p6 := SGVector x: 0.18 y: 0.9 z: 1.
	p7 := SGVector x: 0.9 y: 0.82 z: 1.
	p8 := SGVector x: 0.82 y: 0.1 z: 1.
	label1 := SGPolygonLabel new.
	label1 polygon
		addPoint: p1;
		addPoint: p5;
		addPoint: p2.
	label2 := SGPolygonLabel new.
	label2 polygon
		addPoint: p1;
		addPoint: p2;
		addPoint: p3;
		addPoint: p4.
	label3 := SGPolygonLabel new.
	label3 polygon
		addPoint: p1;
		addPoint: p2;
		addPoint: p3;
		addPoint: p4.
	label4 := SGPolygonLabel new.
	label4 polygon
		addPoint: p1;
		addPoint: p2;
		addPoint: p3;
		addPoint: p4.
	label5 := SGPolygonLabel new.
	label5 polygon
		addPoint: p1;
		addPoint: p2;
		addPoint: p3;
		addPoint: p4.
	pointsR2 add: p1.
	pointsR2 add: p2.
	pointsR2 add: p3.
	pointsR2 add: p4.
	pointsR2 add: p5.
	pointsR2 add: p6.
	pointsR2 add: p7.
	pointsR2 add: p8.
	linesR2 add: (SGLine from: (pointsR2 at: 5) to: (pointsR2 at: 6)).
	linesR2 add: (SGLine from: (pointsR2 at: 6) to: (pointsR2 at: 7)).
	linesR2 add: (SGLine from: (pointsR2 at: 7) to: (pointsR2 at: 8)).
	linesR2 add: (SGLine from: (pointsR2 at: 8) to: (pointsR2 at: 5)).
	linesR2 add: (SGLine from: (pointsR2 at: 1) to: (pointsR2 at: 5)).
	linesR2 add: (SGLine from: (pointsR2 at: 5) to: (pointsR2 at: 2)).
	linesR2 add: (SGLine from: (pointsR2 at: 2) to: (pointsR2 at: 6)).
	linesR2 add: (SGLine from: (pointsR2 at: 6) to: (pointsR2 at: 3)).
	linesR2 add: (SGLine from: (pointsR2 at: 3) to: (pointsR2 at: 7)).
	linesR2 add: (SGLine from: (pointsR2 at: 7) to: (pointsR2 at: 4)).
	linesR2 add: (SGLine from: (pointsR2 at: 4) to: (pointsR2 at: 8)).
	linesR2 add: (SGLine from: (pointsR2 at: 8) to: (pointsR2 at: 1)).
	1 to: 4 do: [ :i | pointMap at: (pointsR1 at: i) put: (pointsR2 at: i) ].
	rule := SGRule fromShape: (SGShape points: pointsR1 lines: linesR1) toShape: (SGShape points: pointsR2 lines: linesR2) mapping: pointMap.
	^ rule