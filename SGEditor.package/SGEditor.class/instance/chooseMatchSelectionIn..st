dialog
chooseMatchSelectionIn: aWindow

	| container |
	container := BlElement new
		layout: (BlLinearLayout vertical);
		background: (Color fromString: '7A8B8B');
		constraintsDo: [ :c |
			c horizontal matchParent.
			c vertical matchParent ];
		yourself.	
	
	SGMatchSelector allSubclassesDo: [ :aMatchSelector|
				|button|
				button := SGButton new.
				button margin: (BlInsets left: 5; top:5).
				button text: aMatchSelector name.
				button addEventHandlerOn: BlClickEvent  do: [ :anEvent|
					grammar rules do:[:aRule|
						aRule matchSelector: (aMatchSelector new).
					].
				aWindow removeChild: container.
					 ].
				container addChild: button. 
		 ].
	aWindow addChild: container