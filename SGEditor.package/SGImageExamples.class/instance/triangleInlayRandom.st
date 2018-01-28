examples
triangleInlayRandom
	<script: 'SGImageExamples new triangleInlayRandom'>
	| builder |
	builder := SGImageBuilder new.
	builder
		from: 1 to: 35 by: 5;
		config: SampleConfigurations new triangleInlayConfig;
		filterIntersections;
				pointColour: Color black;
		pointSize: 5;
		lineColour: Color black;
		lineWidth: 2;
		name: 'triangle_inlay_random';
		folder: self baseFolder;
		size: 500 @ 500;
		selector: (SGRandomSelector onSeed: 1);
		export