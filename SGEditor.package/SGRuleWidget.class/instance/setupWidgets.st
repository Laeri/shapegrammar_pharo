as yet unclassified
setupWidgets
	| mainRow buttonRowAlpha buttonRowBeta resetAlpha resetBeta map col |
	self 	constraintsDo: [ :c | 
			c horizontal matchParent.
			c vertical matchParent ].
		
	mainRow := BlElement new
		layout: BlLinearLayout horizontal;
		background: Color blue.
		
	mainRow
		constraintsDo: [ :c | 
			c horizontal matchParent.
			c vertical matchParent ].
		
			buttonRowAlpha := BlElement new
		layout: BlLinearLayout horizontal;
		background: Color blue.
		
	buttonRowAlpha
		constraintsDo: [ :c | 
			c horizontal matchParent.
			c vertical matchParent ].
		buttonRowAlpha size: (100@ 50).
			buttonRowBeta := BlElement new
		layout: BlLinearLayout horizontal;
		background: Color blue.
		
	buttonRowBeta
		constraintsDo: [ :c | 
			c horizontal matchParent.
			c vertical matchParent ].
		buttonRowBeta size: (100@ 50).
		
		
		alphaColumn := BlElement new
		layout: BlLinearLayout vertical;
		background: Color blue.
		
	alphaColumn
		constraintsDo: [ :c | 
			c horizontal matchParent.
			c vertical matchParent ].
		
		
			betaColumn := BlElement new
		layout: BlLinearLayout vertical;
		background: Color blue.
		
	betaColumn
		constraintsDo: [ :c | 
			c horizontal matchParent.
			c vertical matchParent ].
		
		mainRow addChild: alphaColumn.
		mainRow addChild: betaColumn.
		alphaColumn addChild: buttonRowAlpha .
		betaColumn addChild: buttonRowBeta.
		
		
			resetAlpha := TextButton fromString: 'reset'.
	resetAlpha background: Color magenta muchDarker.
	resetAlpha  size: 70@25.
	resetAlpha
		addEventHandlerOn: BlClickEvent
		do: [ :e | 
				alpha removePointsAndLines .
			].
		
		resetBeta := TextButton fromString: 'reset'.
	resetBeta background: Color magenta muchDarker.
	resetBeta  size: 70@25.
	resetBeta
		addEventHandlerOn: BlClickEvent
		do: [ :e | 
				beta removePointsAndLines .
			].
		
		map := TextButton fromString: 'map'.
	map background: Color magenta muchDarker.
	map  size: 70@25.
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
		
		buttonRowAlpha addChild: resetAlpha .
		buttonRowBeta addChild: resetBeta.
		buttonRowAlpha addChild: map.
		
		
		
		self addChild: mainRow.

self addEventHandlerOn: BlClickEvent  do: [ :event|
			
	 ]. 