as yet unclassified
gtInspectorConfigurationIn: aComposite
	<gtInspectorPresentationOrder: 0>

	aComposite bloc
		title: 'SGConfiguration';
		element: [ 
			|editor|
			editor := SGEditor new.
			editor grammar: self grammar.
			editor shape: self shape.
			editor createMainRow 
			 ]