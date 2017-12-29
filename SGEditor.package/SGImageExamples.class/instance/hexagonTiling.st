examples
hexagonTiling
<script: 'SGImageExamples new hexagonTiling'>
| builder |
builder := SGImageBuilder new.
builder from: 1 to: 5 by: 1;
		config: (SampleConfigurations new hexagonTilingConfig);
		doNotFilterIntersections;
		name: 'hexagon_tiling';
		folder:'bsc-thesis/bsc-thesis/images/shapegrammars/';
		size: 500@500;
		selector: (SGAgeSelector new yourself);
		export.