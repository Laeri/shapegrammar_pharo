as yet unclassified
squareTiling
<gtExample>
	| grammar rule |
	grammar := SGGrammarBuilder new.
	rule := grammar newRule.
	rule alpha
		points:
			{(#a -> (0 @ 0)).
			(#b -> (1 @ 0)).
			(#c -> (1 @ 1)).
			(#d -> (0 @ 1))}.
	rule alpha
		lines:
			{(#a -> #b).
			(#b -> #c).
			(#c -> #d).
			(#d -> #a)}.
	rule beta
		points:
			{(#a -> (0 @ 0)).
			(#b -> (1 @ 0)).
			(#c -> (1 @ 1)).
			(#d -> (0 @ 1)).
			(#e -> (1 @ 2)).
			(#f -> (0 @ 2))}.
	rule beta
		lines:
			{(#a -> #b).
			(#b -> #c).
			(#c -> #d).
			(#d -> #a).
			(#c -> #e).
			(#e -> #f).
			(#f -> #d)}.
	rule
		map:
			{(#a -> #a).
			(#b -> #b).
			(#c -> #c).
			(#d -> #d)}.
	^ grammar build