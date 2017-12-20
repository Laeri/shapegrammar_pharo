as yet unclassified
chooseBaseShapeIn: aWindow
	| container |
	
	container := BlElement new
		layout: (BlGridLayout new columnCount: 10; cellSpacing: 10);
		background: Color yellow;
		constraintsDo: [ :c |
			c horizontal matchParent.
			c vertical matchParent ];
		yourself.	
	
	(SampleConfigurations allSelectorsInProtocol: 'shapes') do: [ :selector |
		| aShape aShapeElement |

		aShape := SampleConfigurations new perform: selector.

		aShapeElement := SGShapeWidget alpha: aShape.
		aShapeElement allChildrenBreadthFirstDo: [ :child|
			child wantsMouse: false ].

		aShapeElement
			addEventHandlerOn: BlClickEvent
			do: [ :anEvent |
				self loadShape: aShape.
				aWindow root removeChild: container ]. 
		container addChild: aShapeElement ].

	aWindow root addChild: container