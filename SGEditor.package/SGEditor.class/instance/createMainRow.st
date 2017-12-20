initialize-release
createMainRow
	| example mainRow rightColumn buttonRow applyRuleButton addNewRuleButton resetShapeButton intersectionBox rotationBox shearingBox reflectionBox somePointsPresent getNextMatchButton |
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

	showShape := SGShapeElement shape: shape.
	"showShape currentRule: grammar rules first."
	showShape requestFocus.	"!!!!!"
	showShape
		constraintsDo: [ :c | 
			c horizontal fitContent.
			c vertical fitContent ].

	mainRow addChild: rightColumn.
	rightColumn addChild: (BlScalableElement new
		constraintsDo: [ :c | 
			c horizontal matchParent.
			c vertical matchParent ];
		contentElement: showShape).

	applyRuleButton := SGButton fromString: 'apply rule'.
	applyRuleButton addEventHandler: ruleApplier.
	applyRuleButton
		addEventHandlerOn: BlClickEvent
		do: [ :e |
			showShape match: SGShapeMatch new.
			showShape ].
	addNewRuleButton := SGButton fromString: 'add new rule'.
	addNewRuleButton
		addEventHandlerOn: BlClickEvent
		do: [ :e | 
			grammar addRule: SGRule emptyRule.
			self loadGrammar: grammar ].
	resetShapeButton := SGButton fromString: 'reset shape'.
	resetShapeButton
		addEventHandlerOn: BlClickEvent
		do: [ :e | shape removeAllPoints ].
		
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
			shapeMatch := grammar rules first selectMatchUsedIn: shape.
			showShape match: shapeMatch.
			showShape showCoordinates.
			"showShape visualizeMatch: aShapeMatch.
			showShape invalidate" ].
		
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