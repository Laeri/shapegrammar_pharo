instance creation
fromGrammar: aGrammar
|widget|
widget := self new.
	widget
		constraintsDo: [ :c | 
			c horizontal matchParent.
			c vertical matchParent ].
	self
		layout: BlLinearLayout vertical;
		background: (Color fromString: 'FFFF00').
		widget grammar: aGrammar.
^ widget.