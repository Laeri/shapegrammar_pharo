examples
sampleShapes
	<script: 'SGImageExamples new sampleShapes'>
	| builder shape blShape basePath name |
	"pointColour: Color black;
		pointSize: 50;
		lineColour: Color black;
		lineWidth: 15;
		"
	builder := SGImageBuilder new.
	basePath := self baseFolder , 'example_shapes/'.
	builder recreateDirectory: basePath.
	shape := SGShapeBuilder new.
	shape
		points:
			{(#a -> (0 @ 0)).
			(#b -> (1 @ 0)).
			(#c -> (1 @ 1)).
			(#d -> (0.6 @ 1.5)).
			(#e -> (-0.25 @ -0.4))}.
	shape
		lines:
			{(#a -> #b).
			(#b -> #c).
			(#c -> #a).
			(#c -> #d).
			(#a -> #e)}.
	shape := shape build.
	blShape := SGShapeElement new.
	blShape
		lineColour: Color black;
		lineWidth: 2;
		pointRadius: 10;
		pointColour: Color black.
		blShape background: Color white.
		blShape shape: shape.
	blShape size: 500 @ 500.
	name := 'shape1'.
	builder save: blShape to: basePath , name.
	shape := SGShapeBuilder new.
	shape
		points:
			{(#a -> (0 @ 2)).
			(#b -> (2 @ 0)).
			(#c -> (3 @ 0)).
			(#d -> (6 @ 0)).
			(#e -> (5 @ 2)).
			(#f -> (5 @ 4)).
			(#g -> (4 @ 2))}.
	shape
		lines:
			{(#a -> #b).
			(#c -> #d).
			(#d -> #e).
			(#e -> #f).
			(#e -> #c)}.
	shape := shape build.
	blShape := SGShapeElement new.
	blShape
		lineColour: Color black;
		lineWidth: 5;
		pointRadius: 40;
		pointColour: Color black.
		blShape background: Color white.
		blShape shape: shape.
	blShape size: 500 @ 500.
	name := 'shape2'.
	builder save: blShape to: basePath , name