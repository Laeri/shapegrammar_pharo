grammars
triangleInlay
<script: 'SGImageExamples new triangleInlay'>
| builder |
builder := SGImageBuilder new.
builder from: 1 to: 5 by: 1;
		config: (SampleConfigurations new triangleInlayConfig );
		doNotFilterIntersections;
				pointColour: Color black;
		pointSize: 20;
		lineColour: Color black;
		lineWidth: 6;
		filterReflections;
		background: Color white;
		name: 'triangle_inlay';
		folder: self baseFolder;
		size: 500@500;
		selector: (SGBalancedSelector new);
		export.