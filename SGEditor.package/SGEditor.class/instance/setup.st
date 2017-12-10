as yet unclassified
setup
	| test shape mainRow showShape  applyRuleButton addNewRuleButton resetShapeButton getNextMatchButton shapeDelta command rightColumn buttonRow |
	test := SGTest new.
	shape := test triangle.
	grammar := test triangleInlayGrammar.
	grammar addRule: test squareRule .
	BlUniverse reset.
	window := BlSpace new.
	window extent: 750 @ 500.
	window
		addEventHandlerOn: BlKeyDownEvent
		do: [ :event | 
			event key = Key c
				ifTrue: [ self chooseConfigWindow ] ].
	mainRow := BlElement new
		layout: BlLinearLayout horizontal;
		background: Color blue.
	mainRow
		constraintsDo: [ :c | 
			c horizontal matchParent.
			c vertical matchParent ].
	leftColumn := BlElement new
		layout: BlLinearLayout vertical;
		background: (Color fromString: 'FFFF00').
	leftColumn
		constraintsDo: [ :c | 
			c horizontal matchParent.
			c vertical matchParent ].
	grammarContainer := SGGrammarContainer fromGrammar: grammar.
	leftColumn addChild: grammarContainer.
	rightColumn := BlElement new
		layout: BlLinearLayout vertical;
		background: Color green.
	rightColumn
		constraintsDo: [ :c | 
			c horizontal matchParent.
			c vertical matchParent ].
	buttonRow := BlElement new
		layout: BlLinearLayout horizontal;
		background: Color blue.
	buttonRow constraintsDo: [ :c | c horizontal matchParent ].
	mainRow addChild: leftColumn.
	showShape := FinalBlShape new.
	showShape currentRule: grammar rules first.
	showShape requestFocus.	"!!!!!"
	showShape shape: shape.
	showShape
		constraintsDo: [ :c | 
			c horizontal matchParent.
			c vertical matchParent ].


	"mainRow addChild: showShape.
	mainRow addChild: rightColumn .
	rightColumn addChild: showShape ."
	mainRow addChild: rightColumn.
	rightColumn addChild: showShape.
	applyRuleButton := TextButton fromString: 'apply rule'.
	applyRuleButton background: Color magenta.
	applyRuleButton size: 70 @ 25.
	applyRuleButton
		addEventHandlerOn: BlClickEvent
		do: [ :e | 
			matchUsed
				ifNil: [ [ command := ChangeShapeCommand
						fromShapeDelta: (grammar rules first getDeltaOn: shape)
						inWidget: showShape.
					command do.
					showShape commandBuffer add: command.
					showShape invalidate.
					matchUsed := nil ] fork ]
				ifNotNil: [ [ shapeDelta := grammar rules first shapeDeltaFrom: shape withMatch: matchUsed.
					command := ChangeShapeCommand fromShapeDelta: shapeDelta inWidget: showShape.
					command do.
					showShape commandBuffer add: command.
					showShape invalidate.
					matchUsed := nil ] fork ] ].
	addNewRuleButton := TextButton fromString: 'add new rule'.
	addNewRuleButton background: Color magenta muchDarker.
	addNewRuleButton size: 70 @ 25.
	addNewRuleButton
		addEventHandlerOn: BlClickEvent
		do: [ :e | 
			grammar addRule: SGRule emptyRule.
			self loadGrammar: grammar.  ].
	resetShapeButton := TextButton fromString: 'reset shape'.
	resetShapeButton background: Color magenta muchDarker muchDarker.
	resetShapeButton size: 70 @ 25.
	resetShapeButton
		addEventHandlerOn: BlClickEvent
		do: [ :e | 
			shape points removeAll.
			shape lines removeAll.
			showShape invalidate ].
	getNextMatchButton := TextButton fromString: 'next match'.
	getNextMatchButton background: Color magenta muchLighter.
	getNextMatchButton size: 70 @ 25.
	getNextMatchButton
		addEventHandlerOn: BlClickEvent
		do: [ :e | 
			[ matchUsed := grammar rules first selectMatchUsedIn: shape.
			showShape visualizeMatch: matchUsed.
			showShape invalidate ] fork ].
	leftColumn addChild: addNewRuleButton.
	buttonRow addChild: resetShapeButton.
	buttonRow addChild: getNextMatchButton.
	buttonRow addChild: applyRuleButton.
	rightColumn addChild: buttonRow.
	window root addChild: mainRow.
	window show