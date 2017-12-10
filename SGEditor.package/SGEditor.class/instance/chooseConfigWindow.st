as yet unclassified
chooseConfigWindow
	|container  shapeHolder ruleWidget configList config |	
	configList := OrderedCollection new.
		container := BlElement new
		layout: (BlGridLayout new columnCount: 10; cellSpacing: 10);
		background: Color yellow;
		constraintsDo: [ :c |
			c horizontal matchParent.
			c vertical matchParent.
			c linear weight: 1 ];
		yourself.	
		(SampleConfigurations  allSelectorsInProtocol: 'grammars') doWithIndex: [:selector :i|
			config := SampleConfigurations new perform: selector.
			configList add: config.
			shapeHolder := BlElement new.
			ruleWidget := SGRuleWidget fromRule: config grammar rules first.
			ruleWidget removeButtons .
			ruleWidget allChildrenBreadthFirstDo: [ :child|
				child removeEventHandlersSuchThat: [:handler|true].
				 ].
			ruleWidget addEventHandlerOn: BlClickEvent  do: [:event| 
					self loadGrammar: ((configList at: i) grammar).
					window root removeChild: container.
				]. 
			shapeHolder addChild: ruleWidget .
			container addChild: shapeHolder .
			].
	
container forceLayout .
	window root addChild: container.
