examples
shape
	<gtExample>
	| shape |
	shape := ShapeBuilder new
		points:
			{(#a -> (0 @ 0)).
			(#b -> (1 @ 0)).
			(#c -> (1 @ 1))};
		lines:
			{(#a -> #b).
			(#b -> #c).
			(#c -> #a)};
		shape.
	^ shape