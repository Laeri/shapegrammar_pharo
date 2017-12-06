as yet unclassified
toMethod: aGrammar on: aClass
|source dslString methodName|
methodName := aGrammar name.
methodName ifNil:[self error:'tried to compile dsl method without name'].
source := WriteStream on: String new.
source << methodName << String cr.
source <<'|dsl grammar rule|' << String cr.
dslString := self toDsl: aGrammar.
source << dslString .
source << String cr << '^ grammar'<<String cr.
source := source contents.
aClass compile: source.
