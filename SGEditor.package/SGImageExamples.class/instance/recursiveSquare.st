grammars
recursiveSquare
<script: 'SGImageExamples new recursiveSquare'>
| builder |
builder := SGImageBuilder new.
builder from: 1 to: 5 by: 1;
		config: (SampleConfigurations new recursiveSquareConfig);
		doNotFilterIntersections;
				pointColour: Color black;
		pointSize: 5;
		lineColour: Color black;
		lineWidth: 2;
		filterReflections;
		name: 'recursive_square';
		folder: self baseFolder;
		size: 500@500;
		selector: (SGBalancedSelector new);
		export.