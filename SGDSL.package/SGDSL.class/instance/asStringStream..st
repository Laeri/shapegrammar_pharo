converting
asStringStream: rule
	| maxSize identifiers |
	maxSize := rule fromShape points size.
	rule toShape points size > maxSize
		ifTrue: [ maxSize := rule toShape points size ].

	"identifiers := (OrderedCollection newFrom:(1 to:maxSize))."
	identifiers := OrderedCollection newFrom: Character alphabet.
	identifiers size < maxSize
		ifTrue: [ identifiers addAll: (1 to: maxSize - identifiers size) ].
	^ self asStringStream: rule withIdentifiers: identifiers