examples
triangleInlayRandom
	<script: 'SGImageExamples new triangleInlayRandom'>
	| builder |
	builder := SGImageBuilder new.
	builder
		from: 1 to: 35 by: 5;
		config: SampleConfigurations new triangleInlayConfig;
		filterIntersections;
		name: 'triangle_inlay_random';
		folder: self baseFolder;
		size: 500 @ 500;
		selector: (SGRandomSelector onSeed: 1);
		export