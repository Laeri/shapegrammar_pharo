initialization
initialize
	| pos tmpP rangeToSelect addPCommand addLCommand l currentDragCommand removeCommand |
	super initialize.
	pointToColor := Dictionary new.
	gridX := 10.
	gridY := 10.
	snapToGrid := true.
	useUniformGrid := true.
	bg := BlImageBackground new.
	self background: bg.
	commandBuffer := OrderedCollection new.
	rangeToSelect := 0.005.

	"Request focus when widget is entered"
	self addEventHandlerOn: BlMouseEnterEvent do: [ :e | self requestFocus ].
	self addEventHandlerOn: BlDragStartEvent do: [ :e | 
		dragSelected ifNotNil:[
		currentDragCommand := MovePointCommand move: dragSelected from: (dragSelected x@dragSelected y) to: nil inWidget: self.].
		Transcript show: 'Drag Start' ].
	
	
	self addEventHandlerOn: BlDragEndEvent do: [ :e |  Transcript show: 'Drag stop'.
		dragSelected ifNotNil:[
			dragSelected set: (self parentToShapePoint: e position).
		currentDragCommand newPosition: (dragSelected x@dragSelected y).
		commandBuffer add: currentDragCommand .
		dragSelected := nil.
		].
		].
	
	"Create an edge: if lctrl is pressed and two points are selected"
	self
		addEventHandlerOn: BlKeyDownEvent
		do: [ :e | 
			
				(e key = Key e) ifTrue:[
					
			(ImageMorph withForm: self background image) openInWorld.
			
			].
		
			e key = Key leftControl
				ifTrue: [ (firstSelectedPoint isNotNil and: secondSelectedPoint isNotNil)
						ifTrue: [
							 l:= SGLine from: firstSelectedPoint to: secondSelectedPoint.
							(shape hasLine:l) ifFalse:[  
							addLCommand := AddLineCommand addLine: l inShape: shape inWidget: self.
							commandBuffer add: addLCommand.
							addLCommand do.
							firstSelectedPoint := secondSelectedPoint.
							secondSelectedPoint := nil.
							] ] ].
			e key = Key z
				ifTrue: [ commandBuffer ifNotEmpty: [commandBuffer last undo.
					commandBuffer removeLast.
					 ]].
			e key = Key d ifTrue:[
				((firstSelectedPoint isNotNil) and: (secondSelectedPoint isNotNil)) ifTrue:[
						"Remove a line"
						(shape isPoint: firstSelectedPoint connectedTo: secondSelectedPoint  )ifTrue:[
						l := shape getLineFrom: firstSelectedPoint to: secondSelectedPoint .
						commandBuffer add: (RemoveLineCommand removeLine: l fromShape: shape inWidget: self).
						commandBuffer last do.].
					] ifFalse:[
				
				firstSelectedPoint  ifNotNil: [removeCommand := RemovePointCommand removePoint: firstSelectedPoint  fromShape: shape inWidget: self.
					commandBuffer add:removeCommand.
					removeCommand do.
				].
			].
		
	
		].
	
		
		
			self invalidate.
].
	"Drag a point: if a point is selected for dragging, move it around"
	self
		addEventHandlerOn: BlDragEvent
		do: [ :e | 
			dragSelected ifNotNil:[
 dragSelected set: (self parentToShapePoint: e position).
					self invalidate ]].

	"Choose point to be dragged: on mouse down"
	self
		addEventHandlerOn: BlMouseDownEvent
		do: [ :e | 
			Transcript
				show: 'Mouse down';
				cr.
			pos := self parentToShapePoint: e position.
			tmpP := shape pointAt: pos inRange: rangeToSelect.
			tmpP ifNotNil: [
					(self isSelected: tmpP) ifFalse:[
					self selectNew: tmpP.] ifTrue:[self removeSelection: tmpP].
					dragSelected := tmpP.
					self invalidate ]
				 ].
	self addEventHandlerOn: BlMouseUpEvent do: [  ].
	self
		addEventHandlerOn: BlClickEvent
		do: [ :e | 
			Transcript
				show: 'Mouse click';
				cr.
			pos := self parentToShapePoint:  e position.
			tmpP := shape pointAt: pos inRange: rangeToSelect.
			tmpP ifNil:[ 
				
				(shape hasPoint: tmpP) ifFalse: [addPCommand := AddPointCommand
						addPoint: (SGVector x: pos x y: pos y)
						inShape: shape
						inWidget: self.
					commandBuffer add: addPCommand.
					addPCommand do.]
					].
			self invalidate.
			Transcript
				show: 'screenPos: ';
				show: e screenPosition;
				cr.
			Transcript
				show: 'position: ';
				show: e position;
				cr.
			Transcript
				show: 'local: ';
				show: pos;
				cr ]