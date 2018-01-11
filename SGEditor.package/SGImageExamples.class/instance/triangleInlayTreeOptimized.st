examples
triangleInlayTreeOptimized
<script: 'SGImageExamples new triangleInlayTreeOptimized'>
| builder config |
builder := SGImageBuilder new.
config := (SampleConfigurations new triangleInlayConfig ).
config grammar rules first optimization useTreeStructure: true.
config grammar rules first optimization onlyNewPoints: false.
builder from: 1 to: 5 by: 1;
		config: config;
		doNotFilterIntersections;
		filterReflections;
		name: 'triangle_inlay_tree_optimized';
		folder: self baseFolder;
		size: 500@500;
		selector: (SGBalancedSelector new);
		export.