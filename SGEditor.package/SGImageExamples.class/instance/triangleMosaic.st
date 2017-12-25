as yet unclassified
triangleMosaic
<script: 'SGImageExamples new triangleMosaic'>
| builder |
builder := SGImageBuilder new.
builder from: 1 to: 5 by: 1;
		config: (SampleConfigurations new triangleMosaicConfig );
		doNotFilterIntersections;
		name: 'triangle_mosaic';
		folder:'Examples/';
		size: 500@500;
		selector: (SGDegreeSelector new yourself);
		export.