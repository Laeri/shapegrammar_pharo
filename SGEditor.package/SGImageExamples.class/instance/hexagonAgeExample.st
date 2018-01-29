examples
hexagonAgeExample
<script: 'SGImageExamples new hexagonAgeExample'>
| builder |
builder := SGImageBuilder new.
builder from: 1 to: 15 by: 1;
		config: (SampleConfigurations new hexagonTilingConfig);
		doNotFilterIntersections;
		pointColour: Color black;
		pointSize: 50;
		lineColour: Color black;
		lineWidth: 15;
		background: Color white;
		name: 'hexagon_age_example';
		folder: self baseFolder;
		size: 500@500;
		selector: (SGAgeSelector new);
		export.