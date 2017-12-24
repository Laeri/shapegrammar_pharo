grammars
triangleInlay
<script: 'SGImageExamples new triangleInlay'>
| builder |
builder := SGImageBuilder new.
builder from: 1 to: 5 by: 1;
		config: (SampleConfigurations new triangleInlayConfig );
		doNotFilterIntersections;
		filterReflections;
		name: 'triangle_inlay';
		folder:'../Examples/';
		size: 500@500;
		selector: (SGBalancedSelector new);
		export.