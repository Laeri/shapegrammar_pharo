examples
triangleTiling
<script: 'SGImageExamples new triangleTiling'>
| builder |
builder := SGImageBuilder new.
builder from: 1 to: 5 by: 1;
		config: (SampleConfigurations new triangleTilingConfig );
		doNotFilterIntersections;
		name: 'triangle_tiling';
		folder: self baseFolder;
		size: 500@500;
		selector: (SGDegreeSelector new yourself);
		export.