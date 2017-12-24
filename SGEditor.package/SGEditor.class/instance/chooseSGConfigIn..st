as yet unclassified
chooseSGConfigIn: aWindow
		| container |
	container := BlElement new
		layout: (BlLinearLayout vertical);
		background: (Color fromString: '7A8B8B');
		constraintsDo: [ :c |
			c horizontal matchParent.
			c vertical matchParent ];
		yourself.	
	
	(SampleConfigurations  allSelectorsInProtocol: 'config') doWithIndex: [:selector :i|
			|config button|
			config := SampleConfigurations new perform: selector.
				button := SGButton new.
				button margin: (BlInsets left: 5; top:5).
				button text: selector asString.
				button addEventHandlerOn: BlClickEvent  do: [ :anEvent|
						self loadConfiguration: config.
						aWindow removeChild: container.
					].
				container addChild: button.
				.].

	aWindow addChild: container
	