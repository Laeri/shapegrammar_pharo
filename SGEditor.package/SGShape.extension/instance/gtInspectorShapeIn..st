*SGEditor
gtInspectorShapeIn: aComposite
	<gtInspectorPresentationOrder: 0>

	aComposite bloc
		title: 'Preview';
		element: [ 
			| aShapeElement |
			aShapeElement := SGShapeElement shape: self.

			BlScalableElement new
				constraintsDo: [ :c |
					c horizontal matchParent.
					c vertical matchParent ];
				contentElement: aShapeElement;
				yourself ]