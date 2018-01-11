examples
triangleInlayBalanced
<script: 'SGImageExamples new triangleInlayBalanced'>
| builder |
builder := SGImageBuilder new.
builder from: 1 to: 35 by: 5;
		config: (SampleConfigurations new triangleInlayConfig );
		doNotFilterIntersections;
		filterReflections;
		name: 'triangle_inlay_balanced';
		folder: self baseFolder;
		size: 500@500;
		selector: (SGBalancedSelector new);
		export.