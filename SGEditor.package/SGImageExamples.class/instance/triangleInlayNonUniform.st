examples
triangleInlayNonUniform
<script: 'SGImageExamples new triangleInlayNonUniform'>
| builder |
builder := SGImageBuilder new.
builder from: 1 to: 35 by: 5;
		config: (SampleConfigurations new triangleInlayConfig );
		filterIntersections;
		name: 'triangle_inlay_non_uniform';
		folder: self baseFolder;
		size: 500@500;
		selector: (SGLineLenghtSelector new);
		export.