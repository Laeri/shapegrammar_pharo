examples
hexagonTilingAgeSelector
<script: 'SGImageExamples new hexagonTilingAgeSelector'>
| builder |
builder := SGImageBuilder new.
builder from: 1 to: 16 by: 5;
		config: (SampleConfigurations new hexagonTilingConfig);
		doNotFilterIntersections;
		name: 'hexagon_tiling_age_selector';
		folder:'bsc-thesis/bsc-thesis/images/shapegrammars/';
		size: 500@500;
		selector: (SGAgeSelector new yourself);
		export.