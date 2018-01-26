shapeExamples
shape
	<gtExample>
	| shape |
	shape := SGShapeBuilder new
		points:
			{(#a -> (0 @ 0)).
			(#b -> (1 @ 0)).
			(#c -> (1 @ 1))};
		lines:
			{(#a -> #b).
			(#b -> #c).
			(#c -> #a)};
		build.
	^ shape