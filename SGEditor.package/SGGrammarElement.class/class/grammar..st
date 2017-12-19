instance creation
grammar: aGrammar
	| widget |

	widget := self new.
	widget layout: BlLinearLayout vertical.
	widget constraintsDo:[:c|
		c horizontal matchParent.
		c vertical matchParent ].
	widget grammar: aGrammar.

	^ widget.