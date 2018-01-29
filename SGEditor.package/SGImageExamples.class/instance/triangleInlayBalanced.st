examples
triangleInlayBalanced
<script: 'SGImageExamples new triangleInlayBalanced'>
| builder |
builder := SGImageBuilder new.
builder from: 1 to: 35 by: 5;
		config: (SampleConfigurations new triangleInlayConfig );
		filterIntersections;
				pointColour: Color black;
		pointSize: 5;
		lineColour: Color black;
		lineWidth: 2;
		background: Color white;
		name: 'triangle_inlay_balanced';
		folder: self baseFolder;
		size: 500@500;
		selector: (SGBalancedSelector new);
		export.