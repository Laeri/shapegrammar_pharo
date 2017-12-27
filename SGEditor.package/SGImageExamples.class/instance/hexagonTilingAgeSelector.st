as yet unclassified
hexagonTilingAgeSelector
<script: 'SGImageExamples new hexagonTilingAgeSelector'>
| builder |
builder := SGImageBuilder new.
builder from: 1 to: 25 by: 5;
		config: (SampleConfigurations new hexagonTilingConfig);
		doNotFilterIntersections;
		name: 'hexagon_tiling_age_selector';
		folder:'Examples/';
		size: 500@500;
		selector: (SGAgeSelector new yourself);
		export.