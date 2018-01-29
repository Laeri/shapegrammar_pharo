grammars
hexagonTiling
<script: 'SGImageExamples new hexagonTiling'>
| builder |
builder := SGImageBuilder new.
builder from: 1 to: 1 by: 1;
		config: (SampleConfigurations new hexagonTilingConfig );
		doNotFilterIntersections;
		pointColour: Color black;
		pointSize: 80;
		lineColour: Color black;
		lineWidth: 25;
		filterReflections;
		background: Color white;
		name: 'hexagon_tiling_grammar';
		folder: self baseFolder;
		size: 500@500;
		selector: (SGBalancedSelector new);
		export.