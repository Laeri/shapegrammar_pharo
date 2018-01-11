examples
squareTiling
<script: 'SGImageExamples new squareTiling'>
| builder |
builder := SGImageBuilder new.
builder from: 1 to: 5 by: 1;
		config: (SampleConfigurations new squareTilingConfig  );
		doNotFilterIntersections;
		name: 'square_tiling';
		folder:self baseFolder ;
		size: 500@500;
		selector: (SGDegreeSelector new yourself);
		export.