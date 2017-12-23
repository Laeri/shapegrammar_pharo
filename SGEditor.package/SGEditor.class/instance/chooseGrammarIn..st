dialog
chooseGrammarIn: aWindow
	|container  shapeHolder ruleWidget  |	
		container := BlElement new
		layout: (BlGridLayout new columnCount: 10; cellSpacing: 10);
		background: Color yellow;
		constraintsDo: [ :c |
			c horizontal matchParent.
			c vertical matchParent.
			c linear weight: 1 ];
		yourself.	
		(SampleConfigurations  allSelectorsInProtocol: 'grammars') doWithIndex: [:selector :i|
			|config|
			config := SampleConfigurations new perform: selector.
			shapeHolder := BlElement new.
			ruleWidget := SGRuleElement rule: config grammar rules first.
			ruleWidget removeButtons .
			ruleWidget allChildrenBreadthFirstDo: [ :child|
				child removeEventHandlersSuchThat: [:handler|true].
				 ].
			ruleWidget addEventHandlerOn: BlClickEvent  do: [:event| 
					self loadGrammar: (config grammar).
					aWindow removeChild: container.
				]. 
			shapeHolder addChild: ruleWidget .
			container addChild: shapeHolder .
			].
	
container forceLayout .
	aWindow addChild: container.
