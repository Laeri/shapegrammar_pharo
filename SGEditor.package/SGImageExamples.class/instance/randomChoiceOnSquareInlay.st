old
randomChoiceOnSquareInlay
	<script: 'SGImageExamples new randomChoiceOnSquareInlay'>
	| builder |
	builder := SGImageBuilder new.
	builder
		from: 1 to: 5 by: 5;
		config: SampleConfigurations new squareInlayConfig;
		doNotFilterIntersections;
				pointColour: Color black;
		pointSize: 50;
		lineColour: Color black;
		lineWidth: 15;
		name: 'square_inlay_random';
		folder: self baseFolder;
		size: 500 @ 500;
		selector: SGRandomSelector new;
		export