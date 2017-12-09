initialization
initialize
|buttonRowAlpha buttonRowBeta mainColumn shapeRow mainRow resetShapeButton resetShapeButtonAlpha resetAlpha resetBeta |
super initialize.

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
		
			buttonRowBeta := BlElement new
		layout: BlLinearLayout horizontal;
		background: Color blue.
		
	buttonRowBeta
		constraintsDo: [ :c | 
			c horizontal matchParent.
			c vertical matchParent ].
		
		
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
		
		buttonRowAlpha addChild: resetAlpha .
		buttonRowBeta addChild: resetBeta.
	
		
		
		
		self addChild: mainRow.

self addEventHandlerOn: BlClickEvent  do: [ :event|
			
	 ]. 