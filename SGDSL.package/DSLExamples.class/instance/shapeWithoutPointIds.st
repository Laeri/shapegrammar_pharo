shapeExamples
shapeWithoutPointIds
	<gtExample>
	| shape |
	shape := SGShapeBuilder new
		points:
			{(0 @ 0).
			(1 @ 0).
			(1 @ 1)};
		lines:
			{(0 @ 0 -> (1 @ 0)).
			(1 @ 0 -> (1 @ 1)).
			(1 @ 1 -> (0 @ 0))};
		build.
	^ shape