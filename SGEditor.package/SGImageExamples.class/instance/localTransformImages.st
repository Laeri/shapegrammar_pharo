examples
localTransformImages
<script: 'SGImageExamples new localTransformImages'>
| builder shape path blShape transf name |
builder := SGImageBuilder new.

shape := SGShapeExamples new triangle .
blShape := ExampleShapeElement new.
self halt.
blShape shape: shape.
path := self baseFolder,'example_shapes/'.
builder recreateDirectory: path.
name := 'original'.
builder save: blShape to: path, name.


transf := SGMatrix p1: shape points first p2: shape points second  p3: shape points third. 
transf := transf getInv.
transf transformAll: shape points.
blShape := ExampleShapeElement new.
self halt.
blShape shape: shape.

name := 'local'.
builder save: blShape to: path, name.

"builder from: 1 to: 5 by: 1;
		config: (SampleConfigurations new squareInlayConfig);
		doNotFilterIntersections;
		filterReflections;
		name: 'local_transform';
		folder:'bsc-thesis/bsc-thesis/images/shapegrammars/';
		size: 500@500;
		selector: (SGBalancedSelector new);
		export."