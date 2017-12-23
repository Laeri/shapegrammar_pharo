initialization
initialize
	| createLineShortCut showPolygonShortcut |
	super initialize.
	
	showPolygons := false.
	
	self layout: BlFitShapeLayout new.
	self
		constraintsDo: [ :c | 
			c horizontal matchParent.
			c vertical matchParent ].
	self clipChildren: false.
	dragHandler := SGDragHandler new.
	dragHandler shapeElement: self.
	self
		addEventHandlerOn: BlClickEvent
		do: [ :anEvent | 
			| aSGVector clickPos |
			clickPos := anEvent currentTarget globalPointToLocal: anEvent position.
			aSGVector := SGVector
				x: clickPos x / self boundingSize
				y: clickPos y / self boundingSize.
			shape addPoint: aSGVector.
			clickSelectionHandler select: (self findPoints: aSGVector) first.
			anEvent consumed: true ].
	clickSelectionHandler := SGClickSelectionHandler new.
	self addEventHandlerOn: BlMouseEnterEvent do: [ :anEvent | self requestFocus ].
	createLineShortCut := BlShortcut new
		combination:
			(BlKeyCombination builder
				control;
				build);
		name: 'createLine';
		action: [ clickSelectionHandler bothSelected
				ifTrue: [ | first second |
					first := clickSelectionHandler firstSelected userData at: #shapeGrammarPoint.
					second := clickSelectionHandler secondSelected userData at: #shapeGrammarPoint.
					shape addLine: (SGLine from: first to: second).
					clickSelectionHandler deselectFirst ] ];
		yourself.
	showPolygonShortcut := BlShortcut new
		combination:
			(BlKeyCombination builder
				key: Key s;
				build);
		name: 'showPolygon';
		action: [ self switchPolygonDraw ];
		yourself.
	self addShortcut: createLineShortCut.
	self addShortcut: showPolygonShortcut