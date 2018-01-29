examples
triangleTiling
<script: 'SGImageExamples new triangleTiling'>
| builder |
builder := SGImageBuilder new.
builder from: 1 to: 5 by: 1;
		config: (SampleConfigurations new triangleTilingConfig );
		doNotFilterIntersections;
				pointColour: Color black;
		pointSize: 50;
		lineColour: Color black;
		lineWidth: 15;
		name: 'triangle_tiling';
		folder: self baseFolder;
		size: 500@500;
		selector: (SGDegreeSelector new);
		export.