converting
asStringStream: rule
	| maxSize identifiers |
	maxSize := rule alpha points size.
	rule beta points size > maxSize
		ifTrue: [ maxSize := rule beta points size ].

	"identifiers := (OrderedCollection newFrom:(1 to:maxSize))."
	identifiers := OrderedCollection newFrom: Character alphabet.
	identifiers size < maxSize
		ifTrue: [ identifiers addAll: (1 to: maxSize - identifiers size) ].
	^ self asStringStream: rule withIdentifiers: identifiers