examples
limitingTiling
	<script: 'SGImageExamples new limitingTiling'>
	| builder config bounds |
	builder := SGImageBuilder new.
	config := SampleConfigurations new triangleTilingConfig.
	bounds := SGPolygon new.
	bounds addPoint: (SGVector x: 0 y: 0).
	bounds addPoint: (SGVector x: 1 y: 0).
	bounds addPoint: (SGVector x: 1 y: 1).
	bounds addPoint: (SGVector x: 0 y: 1).
	builder filter bounds: bounds.
	builder filter filterSomeOutside: true.
	builder
		from: 1 to: 30 by: 1;
		config: config;
		doNotFilterIntersections;
		background: Color white;
		selector: SGAgeSelector new;
		pointColour: Color black;
		pointSize: 25;
		lineColour: Color black;
		lineWidth: 10;
		name: 'limiting_tiling';
		folder: self baseFolder;
		size: 500 @ 500;
		export