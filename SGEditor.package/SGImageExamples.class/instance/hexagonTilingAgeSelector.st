examples
hexagonTilingAgeSelector
<script: 'SGImageExamples new hexagonTilingAgeSelector'>
| builder |
builder := SGImageBuilder new.
builder from: 1 to: 16 by: 5;
		config: (SampleConfigurations new hexagonTilingConfig);
		doNotFilterIntersections;
				pointColour: Color black;
		pointSize: 50;
		lineColour: Color black;
		lineWidth: 15;
		name: 'hexagon_tiling_age_selector';
		folder: self baseFolder;
		size: 500@500;
		selector: (SGAgeSelector new yourself);
		export.