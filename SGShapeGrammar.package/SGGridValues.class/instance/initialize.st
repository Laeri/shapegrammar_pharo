initialization
initialize
	| bins row |
	self
		numberOfBins: 15;
		extentX: 600;
		extentY: 600.
	bins := OrderedCollection new.
	1 to: self numberOfBins do: [ :i | 
		row := OrderedCollection new.
		1 to: self numberOfBins do: [ :j | row add: 0 ].
		bins add: row ].
	self values: bins.