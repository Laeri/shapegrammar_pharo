baselines
baseline: spec
	<baseline>
	spec
		for: #common
		do: [ spec
				baseline: 'Bloc'
					with: [ spec
						repository: 'github://pharo-graphics/Bloc:pharo6.1/src';
						loads: #core ];
				package: 'SGShapeGrammar';
				package: 'SGDSL' with: [ spec requires: #(SGShapeGrammar) ];
				package: 'SGEditor' with: [ spec requires: #(#Bloc 'SGShapeGrammar' 'SGDSL') ] ]