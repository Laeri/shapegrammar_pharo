initialization
initialize
super initialize.
	self addEventHandlerOn: BlKeyDownEvent do:[:e|
		(e key = Key r) ifTrue:[self applyCurrent ].
		(e key = Key t) ifTrue:[
			[1 to: 5 do:[:i|
					self applyCurrent .
				]
			]fork.] 
				]. 
			
		
	