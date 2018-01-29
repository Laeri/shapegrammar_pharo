examples
triangleInlayAgeSelector
<script: 'SGImageExamples new triangleInlayAgeSelector'>
| builder |
builder := SGImageBuilder new.
builder from: 1 to: 25 by: 5;
		config: (SampleConfigurations new triangleInlayConfig );
		filterIntersections;
				pointColour: Color black;
		pointSize: 5;
		lineColour: Color black;
		lineWidth: 2;
		background: Color white;
		name: 'triangle_inlay_age_selector';
		folder: self baseFolder;
		size: 500@500;
		selector: (SGAgeSelector new);
		export.