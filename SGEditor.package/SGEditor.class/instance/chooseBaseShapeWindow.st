as yet unclassified
chooseBaseShapeWindow
|container  tmpShape shapesToChoose sgShape |	
		shapesToChoose := OrderedCollection new.
		container := BlElement new
		layout: (BlGridLayout new columnCount: 10; cellSpacing: 10);
		background: Color yellow;
		constraintsDo: [ :c |
			c horizontal matchParent.
			c vertical matchParent.
			c linear weight: 1 ];
		yourself.	
		(SampleConfigurations  allSelectorsInProtocol: 'shapes') doWithIndex: [:selector :i|
			sgShape := SampleConfigurations new perform: selector.
			shapesToChoose add: sgShape.
			tmpShape := SGShapeWidget fromShape:sgShape.
			tmpShape allChildrenBreadthFirstDo: [ :child|
				child removeEventHandlersSuchThat: [:handler|true].
				 ].
			tmpShape removeEventHandlersSuchThat: [:handler| true ].
			tmpShape addEventHandlerOn: BlClickEvent  do: [:event| 
					self loadShape: (shapesToChoose at: i).
					window root removeChild: container.
				]. 
			container addChild: tmpShape.
			].
	
container forceLayout.
	window root addChild: container.
