as yet unclassified
chooseFileExportIn: aWindow
	| textElement container saveButton quickExportButton |
	container := BlElement new
		layout: (BlLinearLayout vertical);
		background: Color yellow;
		constraintsDo: [ :c |
			c horizontal matchParent .
			c vertical matchParent  ];
		yourself.	
			
	textElement := BlTextEditElement new.
	textElement editListener: BlTextEditListener new.
	textElement addEventHandler: BlSelectionHandler new.
	textElement relocate: 50@50.
	textElement constraintsDo: [ :c |
		c horizontal matchParent.
		c vertical matchParent . ].
	textElement background: Color veryVeryLightGray.
	
	saveButton := SGButton new.
	saveButton text: 'save image'.
	saveButton addEventHandlerOn: BlClickEvent  do: [ :anEvent| 
		self exportPngNamed: textElement text size: self imageSize.
			aWindow removeChild: container.
		].
	saveButton constraintsDo:[:c |
			c horizontal fitContent .
			c vertical fitContent.
		].
	
	quickExportButton := SGButton new.
	quickExportButton text: 'quick export'.
	quickExportButton addEventHandlerOn: BlClickEvent  do: [ :anEvent| 
		self exportPngNamed: 'quick_export' size: self imageSize.
			aWindow removeChild: container.
		].
	quickExportButton constraintsDo:[:c |
			c horizontal fitContent .
			c vertical fitContent.
		].
	
container addChild: textElement .
container addChild: saveButton .
container addChild: quickExportButton.
aWindow addChild: container.