initialize-release
createMainRow
	| exampleConfig mainRow rightColumn buttonRow applyRuleButton addNewRuleButton resetShapeButton intersectionBox rotationBox shearingBox reflectionBox somePointsPresent getNextMatchButton chooseShapeShortcut chooseGrammarShortcut chooseSelectorShortcut chooseConfigShortcut configurations |
	
	configurations := SampleConfigurations new.
	exampleConfig := configurations hexagonTilingConfig.
	shape ifNil: [ 
	shape := exampleConfig shape.].
	grammar ifNil: [
	grammar := exampleConfig grammar.].
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
	showShape
		constraintsDo: [ :c | 
			c horizontal fitContent.
			c vertical fitContent ].
	
	mainRow addChild: rightColumn.
	rightColumn
		addChild:
			(BlScalableElement new
				constraintsDo: [ :c | 
					c horizontal matchParent.
					c vertical matchParent ];
				contentElement: showShape).
	applyRuleButton := SGButton fromString: 'apply rule'.
	applyRuleButton addEventHandler: ruleApplier.
	addNewRuleButton := SGButton fromString: 'add new rule'.
	addNewRuleButton
		addEventHandlerOn: BlClickEvent
		do: [ :e | 
			grammar addRule: SGRule emptyRule.
			self loadGrammar: grammar ].
		
	resetShapeButton := SGButton fromString: 'reset shape'.
	resetShapeButton addEventHandlerOn: BlClickEvent do: [ :e | shape removeAllPoints ].
	
	
	intersectionBox := NamedCheckbox
		fromText: 'intersection'
		onToggleDo: [ :checked | grammar rules first filter intersections: checked ].
	intersectionBox size: 150 @ 25.
	rotationBox := NamedCheckbox
		fromText: 'rotation'
		onToggleDo: [ :checked | grammar rules first filter rotations: checked ].
	rotationBox size: 150 @ 25.
	shearingBox := NamedCheckbox
		fromText: 'shearing'
		onToggleDo: [ :checked | grammar rules first filter shearing: checked ].
	shearingBox size: 150 @ 25.
	reflectionBox := NamedCheckbox
		fromText: 'reflection'
		onToggleDo: [ :checked | grammar rules first filter reflections: checked ].
	reflectionBox size: 150 @ 25.
	somePointsPresent := NamedCheckbox
		fromText: 'present points'
		onToggleDo: [ :checked | grammar rules first filter anyPresentGeometry: checked ].
	somePointsPresent size: 150 @ 25.
	
	
	getNextMatchButton := SGButton fromString: 'next match'.
	getNextMatchButton
		addEventHandlerOn: BlClickEvent
		do: [ :e | 
			shapeMatch := grammar rules first selectMatchUsedIn: shape.
			showShape match: shapeMatch.
			showShape showCoordinates.
			].
		
	leftColumn addChild: addNewRuleButton.
	buttonRow addChild: resetShapeButton.
	buttonRow addChild: getNextMatchButton.
	buttonRow addChild: applyRuleButton.
	rightColumn addChild: intersectionBox.
	rightColumn addChild: shearingBox.
	rightColumn addChild: rotationBox.
	rightColumn addChild: reflectionBox.
	rightColumn addChild: somePointsPresent.
	rightColumn addChild: buttonRow.
	
		chooseShapeShortcut := BlShortcut new
		combination:
			(BlKeyCombination builder
				key: Key c;
				build);
		name: 'chooseShape';
		action: [ self chooseBaseShapeIn: mainRow space root ];
		yourself.
		
		chooseGrammarShortcut := BlShortcut new
		combination:
			(BlKeyCombination builder
				key: Key v;
				build);
		name: 'chooseGrammar';
		action: [ self chooseGrammarIn: mainRow space root ];
		yourself.
		
			chooseSelectorShortcut := BlShortcut new
		combination:
			(BlKeyCombination builder
				key: Key b;
				build);
		name: 'chooseSelector';
		action: [ self chooseMatchSelectionIn:mainRow space root.
			 ];
		yourself.
		
			chooseConfigShortcut := BlShortcut new
		combination:
			(BlKeyCombination builder
				key: Key x;
				build);
		name: 'chooseConfig';
		action: [ self chooseSGConfigIn: mainRow space root.
			 ];
		yourself.
		
	
	mainRow addShortcut: chooseGrammarShortcut .
	mainRow addShortcut: chooseShapeShortcut .
	mainRow addShortcut: chooseSelectorShortcut .
	mainRow addShortcut: chooseConfigShortcut.
	^ mainRow