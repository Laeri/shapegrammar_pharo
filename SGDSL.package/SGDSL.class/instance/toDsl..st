as yet unclassified
toDsl: aGrammar
|name|
name := 'ShapeGrammar'.
aGrammar name ifNotNil: [name := aGrammar name].
^ self toDsl: aGrammar withName: name