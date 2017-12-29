examples
recursiveSquareOptimized
<script: 'SGImageExamples new recursiveSquare'>
| builder config |
config := (SampleConfigurations new recursiveSquareConfig).
config grammar rules first optimization onlyNewPoints: true.
"^ self minimumMaxAgeSelectionFrom: matches fromRule: rule  andShape: shape".
config grammar rules matchSelector: (SGAgeSelector new).
builder := SGImageBuilder new.
builder from: 1 to: 5 by: 1;
		config: config;
		doNotFilterIntersections;
		name: 'recursive_square';
		folder:'bsc-thesis/bsc-thesis/images/shapegrammars/';
		size: 500@500;
		selector: (SGBalancedSelector new);
		export.