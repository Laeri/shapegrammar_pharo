as yet unclassified
chooseConfigWindow
	| choiceWindow container header headerText list space shape str config shapeHolder |
	
		container := BlElement new
		layout: (BlGridLayout new columnCount: 10; cellSpacing: 10);
		background: Color yellow;
		constraintsDo: [ :c |
			c horizontal matchParent.
			c vertical matchParent.
			"will take 100% of the parent"
			c linear weight: 1 ];
		yourself.	

	header := BlElement new
		layout: BlLinearLayout vertical;
		background: (Color black alpha: 0.6);
		constraintsDo: [ :c |
			c horizontal matchParent.
			c vertical fitContent.
			c frame vertical alignTop.
			c padding: (BlInsets top: 15 right: 0 bottom: 15 left: 0) ];
		yourself.

	headerText := BlTextElement new
		text: ((BrRopedText string: 'Configurations')
			attributes: { 
				BrTextForegroundAttribute paint: (Color white alpha: 0.8).
				BrFontSizeAttribute size: 20.
				BrFontWeightAttribute weight: 50.
				BrFontFamilyAttribute named: 'Helvetica Neue'
			};
			yourself);
		constraintsDo: [ :c |
			c horizontal fitContent.
			c vertical fitContent.
			c linear horizontal alignCenter.
			c linear vertical alignCenter ];
		yourself.
		
	"header addChild: headerText.
		container addChildren: {header }."
		SampleConfigurations  selectorsDo:[:selector|
			config := SampleConfigurations new perform: selector.
			shapeHolder := BlElement new.
				shape := BlShape fromShape: (config grammar rules first fromShape).
				shape removeEventHandlersSuchThat: [:ev| true ].
				shape addEventHandlerOn: BlClickEvent  do: [window root removeChild: container.
					self loadGrammar: config grammar.
					  ]. 
				shapeHolder addChild: shape.
				container addChild: shapeHolder .
			].
	
container forceLayout .
	window root addChild: container.
