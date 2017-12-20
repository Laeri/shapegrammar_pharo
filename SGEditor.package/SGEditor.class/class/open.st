instance creation
open
	<script: 'self open'>
	| anEditor aWindow anEditorElement |

	aWindow := BlSpace new.
	aWindow extent: 750 @ 500.

	anEditor := self new.
	anEditorElement := anEditor createMainRow.
	anEditorElement addShortcut: (BlShortcut new
		action: [ anEditor chooseConfigWindow ];
		combination: (BlKeyCombination builder key: Key c; build)).

	anEditorElement addShortcut: (BlShortcut new
		action: [ anEditor chooseBaseShapeIn: aWindow ];
		combination: (BlKeyCombination builder key: Key v; build)).

	anEditorElement requestFocus.
	aWindow root addChild: anEditorElement.
	aWindow show