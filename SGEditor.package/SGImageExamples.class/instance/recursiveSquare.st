grammars
recursiveSquare
<script: 'SGImageExamples new recursiveSquare'>
| builder |
builder := SGImageBuilder new.
builder from: 1 to: 5 by: 1;
		config: (SampleConfigurations new recursiveSquareConfig);
		doNotFilterIntersections;
		filterReflections;
		name: 'recursive_square';
		folder:'bsc-thesis/bsc-thesis/images/shapegrammars/';
		size: 500@500;
		selector: (SGBalancedSelector new);
		export.