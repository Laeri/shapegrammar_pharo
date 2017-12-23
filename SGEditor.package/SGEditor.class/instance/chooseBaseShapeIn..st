dialog
chooseBaseShapeIn: aWindow
	| container |
	container := BlElement new
		layout: (BlGridLayout new columnCount: 5; cellSpacing: 10);
		background: Color yellow;
		constraintsDo: [ :c |
			c horizontal matchParent.
			c vertical matchParent ];
		yourself.	
	
	(SampleConfigurations allSelectorsInProtocol: 'shapes') do: [ :selector |
		| aShape aShapeElement |

		aShape := SampleConfigurations new perform: selector.

		aShapeElement := SGShapeElement shape: aShape.
		aShapeElement constraintsDo:[:c|c horizontal fitContent . c vertical fitContent ].
		aShapeElement removeEventHandlersSuchThat: [ :aHandler| true].
		aShapeElement
			addEventHandlerOn: BlClickEvent
			do: [ :anEvent |
				self loadShape: aShape.
				aWindow removeChild: container ]. 
		container addChild: aShapeElement ].

	aWindow addChild: container