examples
triangleInlayBalanced
<script: 'SGImageExamples new triangleInlayBalanced'>
| builder |
builder := SGImageBuilder new.
builder from: 1 to: 5 by: 1;
		config: (SampleConfigurations new triangleInlayConfig );
		doNotFilterIntersections;
		filterReflections;
		name: 'triangle_inlay_balanced';
		folder:'bsc-thesis/bsc-thesis/images/shapegrammars/';
		size: 500@500;
		selector: (SGBalancedSelector new);
		export.