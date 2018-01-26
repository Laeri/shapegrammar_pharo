grammarExamples
triangleInlayGrammar
	<gtExample>
	| dsl rule grammar |
	dsl := SGDSL new.
	rule := dsl newRule.
	rule alpha
		points:
			{(#a -> (0 @ 0)).
			(#b -> (1 @ 0)).
			(#c -> (1 @ 1))}.
	rule alpha
		lines:
			{(#a -> #b).
			(#b -> #c).
			(#c -> #a)}.
	rule beta
		points:
			{(#a -> (0 @ 0)).
			(#b -> (1 @ 0)).
			(#c -> (1 @ 1)).
			(#d -> (0.7 @ 0.3))}.
	rule beta
		lines:
			{(#a -> #b).
			(#b -> #c).
			(#c -> #a).
			(#a -> #d).
			(#b -> #d).
			(#c -> #d)}.
	rule
		map:
			{(#a -> #a).
			(#b -> #b).
			(#c -> #c)}.
	grammar := dsl grammar.
	^ grammar