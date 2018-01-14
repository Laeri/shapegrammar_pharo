examples
sierpinskiTriangle
<script: 'SGImageExamples new sierpinskiTriangle'>
| builder |
builder := SGImageBuilder new.
builder from: 1 to: 5 by: 1;
		config: (SampleConfigurations new sierpinskiInlayConfig);
		doNotFilterIntersections;
		filterReflections;
		name: 'sierpinski_triangle';
		folder: self baseFolder;
		size: 500@500;
		selector: (SGBalancedSelector new);
		export.