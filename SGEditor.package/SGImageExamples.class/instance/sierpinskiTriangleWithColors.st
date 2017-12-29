grammars
sierpinskiTriangleWithColors
<script: 'SGImageExamples new sierpinskiTriangleWithColors'>
| builder |
builder := SGImageBuilder new.
builder from: 1 to: 5 by: 1;
		config: (SampleConfigurations new sierpinskiInlayConfig);
		doNotFilterIntersections;
		filterReflections;
		name: 'sierpinski_triangle_colors';
		folder:'bsc-thesis/bsc-thesis/images/shapegrammars/';
		size: 500@500;
		showPolygons ;
		selector: (SGBalancedSelector new);
		export.