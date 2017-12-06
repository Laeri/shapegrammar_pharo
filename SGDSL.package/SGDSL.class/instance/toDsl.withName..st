as yet unclassified
toDsl: aGrammar withName: aName
	| stream |
	stream := WriteStream on: String new.
	stream << '"' <<String cr <<'Name: ' << aName <<String cr <<'A dsl representation of a shape grammar' <<String cr.
	stream << 'Created by: SGShapeGrammar Editor' <<'Programmed by: lw' << String cr <<'"' << String cr.
	stream << 'dsl := ' << self className << ' new.' << String cr.
	aGrammar rules do: [ :rule | 
		stream << (self asStringStream: rule)contents <<String cr.
		 ].
	stream << 'grammar := dsl grammar.' << String cr.
^ stream contents .