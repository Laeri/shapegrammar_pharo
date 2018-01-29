examples
triangleIntersection
	<script: 'SGImageExamples new triangleIntersection'>
	| builder |
	builder := SGImageBuilder new.
	builder
		from: 1 to: 5 by: 1;
		config: SampleConfigurations new triangleInlayConfig;
		doNotFilterIntersections;
		pointColour: Color black;
		pointSize: 5;
		lineColour: Color black;
		lineWidth: 2;
		background: Color white;
		name: 'triangle_intersection';
		folder: self baseFolder;
		size: 500 @ 500;
		selector: (SGRandomSelector onSeed: 12);
		export