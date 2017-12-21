as yet unclassified
gtInspectorPolygonIn: aComposite
	<gtInspectorPresentationOrder: 0>

	| aSGShape theLines |
	aComposite bloc
		title: 'SGPolygon';
		element: [ 
			| aShapeElement|
			aSGShape := SGShape new.
			aSGShape points: self points.
			theLines := OrderedCollection new.
			self points doWithIndex:[:aPoint :i|
					i < self points size ifTrue:[
							theLines add: (SGLine from: aPoint to: (self points at: i+1)).
						] ifFalse:[theLines add: (SGLine from: aPoint to: (self points first))].
				].
			aSGShape lines: theLines.
			
			aShapeElement := SGShapeElement shape: aSGShape.

			BlScalableElement new
				constraintsDo: [ :c |
					c horizontal matchParent.
					c vertical matchParent ];
				contentElement: aShapeElement;
				yourself ]