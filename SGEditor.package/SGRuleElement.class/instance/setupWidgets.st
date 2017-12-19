as yet unclassified
setupWidgets
	| mainRow  resetAlpha resetBeta map col removeRule |
	
	self constraintsDo: [ :c | 
		c horizontal matchParent.
		c vertical matchParent ].
		
	mainRow := BlElement new
		layout: BlLinearLayout horizontal.

	mainRow
		constraintsDo: [ :c | 
			c horizontal matchParent.
			c vertical matchParent ].

	buttonRowAlpha := BlElement new
		layout: (BlGridLayout horizontal cellSpacing: 10; columnCount: 2).

	buttonRowAlpha
		constraintsDo: [ :c | 
			c horizontal matchParent.
			c vertical fitContent ].

	buttonRowBeta := BlElement new
		layout: (BlGridLayout horizontal cellSpacing: 10; columnCount: 2).
		
	buttonRowBeta
		constraintsDo: [ :c | 
			c horizontal matchParent.
			c vertical fitContent ].
		
	alphaColumn := BlElement new
		layout: BlLinearLayout vertical.
		
	alphaColumn
		constraintsDo: [ :c | 
			c horizontal matchParent.
			c vertical matchParent ].
		
	betaColumn := BlElement new
		layout: BlLinearLayout vertical.
		
	betaColumn
		constraintsDo: [ :c | 
			c horizontal matchParent.
			c vertical matchParent ].
		
	mainRow addChild: alphaColumn.
	mainRow addChild: betaColumn.
	alphaColumn addChild: buttonRowAlpha .
	betaColumn addChild: buttonRowBeta.
		
		
	resetAlpha := SGButton fromString: 'reset'.
	resetAlpha
		addEventHandlerOn: BlClickEvent
		do: [ :e | 
				alpha removePointsAndLines.
				alpha removeLabels.
			].
		
	resetBeta := SGButton fromString: 'reset'.
	resetBeta
		addEventHandlerOn: BlClickEvent
		do: [ :e | 
				beta removePointsAndLines .
				beta removeLabels.
			].
		
		
	removeRule := SGButton fromString: 'remove rule'.
	removeRule
		addEventHandlerOn: BlClickEvent
		do: [ :e | ].
		
	map := SGButton fromString: 'map'.
	map
		addEventHandlerOn: BlClickEvent
		do: [ :e | 
				(alpha onlyOneSelected and: beta onlyOneSelected ) ifTrue:[
						rule mapPoint: alpha firstSelected  to: beta firstSelected.
						col := self nextColor .
						Transcript show: col; cr.
						alpha mapPoint: alpha firstSelected toColor: col.
						beta mapPoint: beta firstSelected toColor: col.  
						alpha unselect: alpha firstSelected .
						beta unselect: beta firstSelected .
						self invalidate.
					]
			].
		
		buttonRowAlpha addChild: resetAlpha.
		buttonRowAlpha addChild: map.
		
		buttonRowBeta addChild: resetBeta.
		buttonRowBeta addChild: removeRule.
		
		self addChild: mainRow.

	self addEventHandlerOn: BlClickEvent  do: [ :event|
			
	 ]. 