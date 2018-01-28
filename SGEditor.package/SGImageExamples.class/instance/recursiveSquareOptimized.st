examples
recursiveSquareOptimized
<script: 'SGImageExamples new recursiveSquareOptimized'>
| builder config|
config := (SampleConfigurations new recursiveSquareHighRes).
config grammar rules first matchSelector: (SGAgeSelector new).
config grammar rules first optimization onlyNewPoints: true.
builder := SGImageBuilder new.
builder from: 1 to: 170 by: 1;
		config: config;
		doNotFilterIntersections;
		pointColour: Color black;
		pointSize: 5;
		lineColour: Color black;
		lineWidth: 2;
		filterReflections ;
		background: Color white;
		name: 'recursive_square_optimized';
		folder: self baseFolder;
		size: 1000@1000;
		selector: (SGAgeSelector new);
		export.