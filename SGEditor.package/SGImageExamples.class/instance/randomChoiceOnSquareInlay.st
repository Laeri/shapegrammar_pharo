examples
randomChoiceOnSquareInlay
	<script: 'SGImageExamples new randomChoiceOnSquareInlay'>
	| builder |
	builder := SGImageBuilder new.
	builder
		from: 1 to: 5 by: 5;
		config: SampleConfigurations new squareConfig;
		doNotFilterIntersections;
		name: 'square_inlay_random';
		folder: self baseFolder;
		size: 500 @ 500;
		selector: SGRandomSelector new;
		export