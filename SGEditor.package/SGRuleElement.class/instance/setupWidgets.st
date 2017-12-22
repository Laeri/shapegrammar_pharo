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
		do: [ self rule alpha removeAllPoints ].
		
	resetBeta := SGButton fromString: 'reset'.
	resetBeta
		addEventHandlerOn: BlClickEvent
		do: [ self rule beta removeAllPoints ].

	removeRule := SGButton fromString: 'remove rule'.
	removeRule
		addEventHandlerOn: BlClickEvent
		do: [  ].
		
	map := SGButton fromString: 'map'.
	map
		addEventHandlerOn: BlClickEvent
		do: [ :e |
				((self alphaShapeElement clickSelectionHandler onlyFirstSelected) and: (self betaShapeElement clickSelectionHandler onlyFirstSelected )) ifTrue:[
					|anAlphaPoint aBetaPoint anAlphaBlElement aBetaBlElement|
					anAlphaBlElement := self alphaShapeElement clickSelectionHandler firstSelected .
					anAlphaPoint := anAlphaBlElement userData at: #shapeGrammarPoint.
					aBetaBlElement := self betaShapeElement clickSelectionHandler firstSelected . 
					aBetaPoint := aBetaBlElement userData at: #shapeGrammarPoint.
					col := self nextColor.
					  rule mapPoint: anAlphaPoint to: aBetaPoint .
						self alphaShapeElement clickSelectionHandler deselect: anAlphaBlElement .
						self betaShapeElement clickSelectionHandler deselect: aBetaBlElement .
					self mapPoint: anAlphaBlElement  toColor: col.
						self mapPoint: aBetaBlElement toColor: col.
					
					].
				
				
			].
		
		buttonRowAlpha addChild: resetAlpha.
		buttonRowAlpha addChild: map.
		
		buttonRowBeta addChild: resetBeta.
		buttonRowBeta addChild: removeRule.
		
		self addChild: mainRow.

	self addEventHandlerOn: BlClickEvent  do: [ :event|
			
	 ]. 