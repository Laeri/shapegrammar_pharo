examples
randomChoiceOnSquareInlay
	<script: 'SGImageExamples new randomChoiceOnSquareInlay'>
	| builder |
	builder := SGImageBuilder new.
	builder
		from: 1 to: 25 by: 5;
		config: SampleConfigurations new squareConfig;
		doNotFilterIntersections;
		name: 'square_inlay_random';
		folder: '../Examples/';
		size: 500 @ 500;
		selector: SGRandomSelector new;
		export