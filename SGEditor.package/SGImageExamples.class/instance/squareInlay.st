grammars
squareInlay
<script: 'SGImageExamples new squareInlay'>
| builder |
builder := SGImageBuilder new.
builder from: 1 to: 5 by: 1;
		config: (SampleConfigurations new squareInlayConfig);
		doNotFilterIntersections;
		filterReflections;
		name: 'square_inlay';
		folder:'../Examples/';
		size: 500@500;
		selector: (SGBalancedSelector new);
		export.