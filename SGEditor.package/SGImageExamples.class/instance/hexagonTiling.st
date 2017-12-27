as yet unclassified
hexagonTiling
<script: 'SGImageExamples new hexagonTiling'>
| builder |
builder := SGImageBuilder new.
builder from: 1 to: 5 by: 1;
		config: (SampleConfigurations new hexagonTilingConfig);
		doNotFilterIntersections;
		name: 'hexagon_tiling';
		folder:'Examples/';
		size: 500@500;
		selector: (SGAgeSelector new yourself);
		export.