as yet unclassified
hexagon
	<gtExample>
	| shape |
	shape := SGDSL new newShape.
	shape
		points:
			{(#a -> (-1 @ -2)).
			(#b -> (1 @ -2)).
			(#c -> (2 @ 0)).
			(#d -> (1 @ 2)).
			(#e -> (-1 @ 2)).
			(#f -> (-2 @ 0))}.
	shape
		lines:
			{(#a -> #b).
			(#b -> #c).
			(#c -> #d).
			(#d -> #e).
			(#e -> #f).
			(#f -> #a)}.
	^ shape build