config
sierpinskiInlayColourConfig
	<gtExample>
	| config triangle label |
	config := SGConfiguration new.
	config grammar: SGGrammarExamples new sierpinskiColor.
	triangle := SGShapeExamples new triangle.
	label := SGPolygonLabel new.
	label color: Color red.
	label polygonPoints: triangle points.
	triangle addLabel: label.
	config shape: SGShapeExamples new triangle.
	^ config