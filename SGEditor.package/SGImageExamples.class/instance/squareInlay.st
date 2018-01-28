old
squareInlay
<script: 'SGImageExamples new squareInlay'>
| builder |
builder := SGImageBuilder new.
builder from: 1 to: 5 by: 1;
		config: (SampleConfigurations new squareInlayConfig);
		doNotFilterIntersections;
		filterReflections;
				pointColour: Color black;
		pointSize: 50;
		lineColour: Color black;
		lineWidth: 15;
		name: 'square_inlay';
		folder: self baseFolder;
		size: 500@500;
		selector: (SGBalancedSelector new);
		export.