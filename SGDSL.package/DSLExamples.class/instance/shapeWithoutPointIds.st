examples
shapeWithoutPointIds
	<gtExample>
	| shape |
	shape := ShapeBuilder new
		points:
			{(0 @ 0).
			(1 @ 0).
			(1 @ 1)};
		lines:
			{(0 @ 0 -> (1 @ 0)).
			(1 @ 0 -> (1 @ 1)).
			(1 @ 1 -> (0 @ 0))};
		shape.
	^ shape