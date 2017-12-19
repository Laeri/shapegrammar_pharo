initialize-release
createMainRow
	| example mainRow rightColumn buttonRow applyRuleButton command shapeDelta addNewRuleButton resetShapeButton intersectionBox rotationBox shearingBox reflectionBox somePointsPresent getNextMatchButton |
	example := SGGrammarExamples new.
	shape := example triangleWithLabel.
	grammar := example triangleInlayGrammarWithLabels.
	
	grammarElement := SGGrammarElement grammar: grammar.
	

	mainRow := SGEditorElement new.

	leftColumn := BlElement new layout: BlLinearLayout vertical.
	leftColumn
		constraintsDo: [ :c | 
			c horizontal matchParent.
			c vertical matchParent ].
	leftColumn addChild: grammarElement.

	rightColumn := BlElement new layout: BlLinearLayout vertical.
	rightColumn
		constraintsDo: [ :c | 
			c horizontal matchParent.
			c vertical matchParent ].
	buttonRow := BlElement new layout: BlLinearLayout horizontal.
	buttonRow
		constraintsDo: [ :c |
			c horizontal fitContent.
			c vertical fitContent ].

	mainRow addChild: leftColumn.
	showShape := SGFinalShapeWidget new.
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
	applyRuleButton := SGButton fromString: 'apply rule'.
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
	addNewRuleButton := SGButton fromString: 'add new rule'.
	addNewRuleButton
		addEventHandlerOn: BlClickEvent
		do: [ :e | 
			grammar addRule: SGRule emptyRule.
			self loadGrammar: grammar ].
	resetShapeButton := SGButton fromString: 'reset shape'.
	resetShapeButton
		addEventHandlerOn: BlClickEvent
		do: [ :e | 
			shape points removeAll.
			shape lines removeAll.
			showShape invalidate ].
	intersectionBox := NamedCheckbox fromText: 'intersection' onToggleDo: [ :checked | 
				grammar rules first filter intersection: checked.
			].
		intersectionBox size: 150@25.
		rotationBox := NamedCheckbox fromText: 'rotation' onToggleDo: [ :checked | 
				grammar rules first filter rotations: checked.
			].
		rotationBox size: 150@25.
		shearingBox := NamedCheckbox fromText: 'shearing' onToggleDo: [ :checked | 
				grammar rules first filter shearing: checked.
			].
		shearingBox size: 150@25.
		reflectionBox  := NamedCheckbox fromText: 'reflection' onToggleDo: [ :checked | 
				grammar rules first filter reflections: checked.
			].
		reflectionBox size: 150@25.
		somePointsPresent   := NamedCheckbox fromText: 'present points' onToggleDo: [ :checked | 
				grammar rules first filter somePresentPoints: checked.
			].
			somePointsPresent size: 150@25.
			
	getNextMatchButton := SGButton fromString: 'next match'.
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
	rightColumn  addChild: intersectionBox .
	rightColumn addChild: shearingBox .
	rightColumn addChild: rotationBox.
	rightColumn addChild: reflectionBox.
	rightColumn addChild: somePointsPresent.
	rightColumn addChild: buttonRow.
	
	^ mainRow