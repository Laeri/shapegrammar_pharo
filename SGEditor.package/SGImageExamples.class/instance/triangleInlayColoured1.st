examples
triangleInlayColoured1
<script: 'SGImageExamples new triangleInlayColoured1'>
| builder |
builder := SGImageBuilder new.
builder from: 1 to: 25 by: 5;
		config: (SampleConfigurations new triangleInlayConfig );
		filterIntersections;
		name: 'triangle_inlay_age_selector';
		folder: self baseFolder;
		size: 500@500;
		selector: (SGAgeSelector new);
		export.