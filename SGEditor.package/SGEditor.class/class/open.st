instance creation
open
	<script: 'self open'>
	| anEditorElement window |
	
	anEditorElement := self new.
	
	window := BlSpace new.
	window extent: 750 @ 500.
	window
		addEventHandlerOn: BlKeyDownEvent
		do: [ :event | 
			event key = Key c
				ifTrue: [ anEditorElement chooseConfigWindow ].
				
				event key = Key v ifTrue: [ anEditorElement chooseBaseShapeWindow ] ].
	
	window root addChild: anEditorElement createMainRow.
	window show