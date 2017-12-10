instance creation
fromGrammar: aGrammar
|widget|

widget := self new.
widget background: Color magenta .
widget layout: BlLinearLayout vertical.
widget constraintsDo:[:c|
	c horizontal matchParent.
	c vertical matchParent.
].
widget grammar: aGrammar.

^ widget.