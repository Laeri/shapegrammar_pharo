examples
triangleRandomIsBadExample
	<script: 'SGImageExamples new triangleRandomIsBadExample'>
	| builder |
	builder := SGImageBuilder new.
	builder
		from: 1 to: 5 by: 1;
		config: SampleConfigurations new triangleInlayConfig;
		filterIntersections;
		pointColour: Color black;
		pointSize: 7;
		lineColour: Color black;
		lineWidth: 3;
		background: Color white;
		name: 'triangle_random_bad';
		folder: self baseFolder;
		size: 500 @ 500;
		selector: (SGRandomSelector onSeed: 3);
		export