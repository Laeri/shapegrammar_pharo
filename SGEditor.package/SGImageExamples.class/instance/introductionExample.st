grammars
introductionExample
<script: 'SGImageExamples new introductionExample'>
| builder |
builder := SGImageBuilder new.
builder from: 1 to: 5 by: 1;
		config: (SampleConfigurations new introductionExampleConfig);
		doNotFilterIntersections;
		filterReflections;
		name: 'introduction_example';
		folder: self baseFolder;
		size: 500@500;
		selector: (SGBalancedSelector new);
		export.