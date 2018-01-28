examples
hexagonTiling
<script: 'SGImageExamples new hexagonTiling'>
| builder |
builder := SGImageBuilder new.
builder from: 1 to: 5 by: 1;
		config: (SampleConfigurations new hexagonTilingConfig);
		doNotFilterIntersections;
				pointColour: Color black;
		pointSize: 50;
		lineColour: Color black;
		lineWidth: 15;
		name: 'hexagon_tiling';
		folder: self baseFolder;
		size: 500@500;
		selector: (SGAgeSelector new yourself);
		export.