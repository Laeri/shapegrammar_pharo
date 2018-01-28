config
introductionExampleConfig
	<gtExample>
	| config shapeBuilder |
	config := SGConfiguration new.
	config grammar: SGGrammarExamples new recursiveSquareGrammar.
	shapeBuilder := SGShapeBuilder new.
	shapeBuilder
		points:
			{(#a -> (0 @ 0)).
			(#b -> (4 @ 0)).
			(#c -> (4 @ 4)).
			(#d -> (0 @ 4)).
			(#e -> (2 @ 5)).
			(#f -> (3 @ 6)).
			(#g -> (2 @ 7)).
			(#h -> (1 @ 6))}.
	shapeBuilder
		lines:
			{(#a -> #b).
			(#b -> #c).
			(#c -> #d).
			(#d -> #a).
			(#e -> #f).
			(#f -> #g).
			(#g -> #h).
			(#h -> #e)}.
	config shape: shapeBuilder build.
	^ config