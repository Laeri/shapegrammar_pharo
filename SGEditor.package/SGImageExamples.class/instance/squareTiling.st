examples
squareTiling
<script: 'SGImageExamples new squareTiling'>
| builder |
builder := SGImageBuilder new.
builder from: 1 to: 5 by: 1;
		config: (SampleConfigurations new squareTilingConfig  );
		doNotFilterIntersections;
				pointColour: Color black;
		pointSize: 50;
		lineColour: Color black;
		lineWidth: 15;
		name: 'square_tiling';
		folder:self baseFolder ;
		size: 500@500;
		selector: (SGDegreeSelector new yourself);
		export.