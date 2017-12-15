TriangleInlayGrammar
triangleInlayRuleWithLabels
	|   pointMap pointsR1 linesR1 pointsR2 linesR2 rule pa pb pc pd label1 label2 label3 polygonPoints label alphaToBetaLabels betaLabels |
pointMap := Dictionary new.
	pointsR1 := OrderedCollection new.
	linesR1 := OrderedCollection new.
	pa := (SGVector x: 0.1 y: 0.1 z: 1).
	pb := (SGVector x: 0.9 y: 0.1 z: 1).
	pc := (SGVector x: 0.9 y: 0.9 z: 1).
	pointsR1 add: pa.
	pointsR1 add: pb.
	pointsR1 add: pc.
	label := SGPolygonLabel new.
	label polygonPoints add: pa; add: pb; add: pc.
	label color: Color blue.
	linesR1 add: (SGLine from: (pointsR1 at: 1) to: (pointsR1 at: 2)).
	linesR1 add: (SGLine from: (pointsR1 at: 2) to: (pointsR1 at: 3)).
	linesR1 add: (SGLine from: (pointsR1 at: 1) to: (pointsR1 at: 3)).
	pointsR2 := OrderedCollection new.
	linesR2 := OrderedCollection new.
	
	pa := (SGVector x: 0.1 y: 0.1 z: 1).
	pb := (SGVector x: 0.9 y: 0.1 z: 1).
	pc := (SGVector x: 0.9 y: 0.9 z: 1).
	pd := (SGVector x: 0.5 y: 0.25 z: 1).
	pointsR2 add: pa.
	pointsR2 add: pb.
	pointsR2 add: pc.
	pointsR2 add: pd.
	
	label1 := SGPolygonLabel new.
	label1 polygonPoints add: pa; add: pb; add: pd.
	label2 := SGPolygonLabel new.
	label2 polygonPoints add: pb; add: pc; add: pd.
	label3 := SGPolygonLabel new.
	label3 polygonPoints add: pc; add: pa; add: pd.

label1 color:Color yellow.
label2 color:Color yellow.
label3 color:Color yellow.
	linesR2 add: (SGLine from: (pointsR2 at: 1) to: (pointsR2 at: 2)).
	linesR2 add: (SGLine from: (pointsR2 at: 2) to: (pointsR2 at: 3)).
	linesR2 add: (SGLine from: (pointsR2 at: 1) to: (pointsR2 at: 3)).
	linesR2 add: (SGLine from: (pointsR2 at: 1) to: (pointsR2 at: 4)).
	linesR2 add: (SGLine from: (pointsR2 at: 2) to: (pointsR2 at: 4)).
	linesR2 add: (SGLine from: (pointsR2 at: 3) to: (pointsR2 at: 4)).
	
	1 to: 3 do: [ :i | pointMap at: (pointsR1 at: i) put: (pointsR2 at: i) ].
	rule := SGRule
		fromShape: (SGShape points: pointsR1 lines: linesR1)
		toShape: (SGShape points: pointsR2 lines: linesR2) mapping: pointMap.
	rule alphaToBeta: pointMap.
	
	rule fromShape addLabel: label.
	rule toShape addLabel: label1; addLabel: label2; addLabel: label3.
	
	rule onLabel: SGPolygonLabel  do: [ :l|Transcript show: 'transform label '; show: l; cr.
				l color: (l color lighter).
		 ]. 
	alphaToBetaLabels := Dictionary new.
	betaLabels := OrderedCollection new.
	betaLabels add: label1; add: label2; add:label3.
	alphaToBetaLabels at: label put: betaLabels .
	rule alphaToBetaLabels: alphaToBetaLabels.
	^ rule