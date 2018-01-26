accessing structure variables
map: value

(value isKindOf: Association ) ifTrue:[
map add: value.]
ifFalse:[
	(value isKindOf: Collection) ifTrue:[
			value do: [:el|
					self map: el.
				].
		].
	].
