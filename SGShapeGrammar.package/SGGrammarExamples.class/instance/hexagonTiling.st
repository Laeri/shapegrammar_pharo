as yet unclassified
hexagonTiling
	<gtExample>
	| grammar rule |
	grammar := SGGrammarBuilder new.
	rule := grammar newRule.
	rule alpha
		points:
			{(#a -> (-1 @ -2)).
			(#b -> (1 @ -2)).
			(#c -> (2 @ 0)).
			(#d -> (1 @ 2)).
			(#e -> (-1 @ 2)).
			(#f -> (-2 @ 0))}.
	rule alpha
		lines:
			{(#a -> #b).
			(#b -> #c).
			(#c -> #d).
			(#d -> #e).
			(#e -> #f).
			(#f -> #a)}.
	rule beta
		points:
			{(#a -> (-1 @ -2)).
			(#b -> (1 @ -2)).
			(#c -> (2 @ 0)).
			(#d -> (1 @ 2)).
			(#e -> (-1 @ 2)).
			(#f -> (-2 @ 0)).
			(#g -> (4 @ 0)).
			(#h -> (5 @ 2)).
			(#i -> (4 @ 4)).
			(#j -> (2 @ 4))}.
	rule beta
		lines:
			{(#a -> #b).
			(#b -> #c).
			(#c -> #d).
			(#d -> #e).
			(#e -> #f).
			(#f -> #a).
			(#c -> #g).
			(#g -> #h).
			(#h -> #i).
			(#i -> #j).
			(#j -> #d)}.
	rule map: { #a -> #a. #b -> #b. #c -> #c. #d -> #d. #e -> #e. #f -> #f }.
	^ grammar build