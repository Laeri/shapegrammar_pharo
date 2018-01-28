examples
sierpinskiTriangleWithColors
<script: 'SGImageExamples new sierpinskiTriangleWithColors'>
| builder |
builder := SGImageBuilder new.
builder from: 1 to: 5 by: 1;
		config: (SampleConfigurations new sierpinskiInlayConfig);
		doNotFilterIntersections;
		filterReflections;
				pointColour: Color black;
		pointSize: 50;
		lineColour: Color black;
		lineWidth: 15;
		colour;
		name: 'sierpinski_triangle_colors';
		folder: self baseFolder;
		size: 500@500;
		showPolygons ;
		selector: (SGBalancedSelector new);
		export.