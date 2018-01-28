examples
introductionExample
<script: 'SGImageExamples new introductionExample'>
| builder config |
builder := SGImageBuilder new.
config := SampleConfigurations new introductionExampleConfig.
config grammar rules first matchSelector seed: 1.
builder from: 1 to: 5 by: 1;
		config: (config);
		doNotFilterIntersections;
		filterReflections;
		pointColour: Color black;
		pointSize: 50;
		lineColour: Color black;
		lineWidth: 15;
		name: 'introduction_example';
		folder: self baseFolder;
		size: 500@500;
		selector: (SGBalancedSelector new);
		export.