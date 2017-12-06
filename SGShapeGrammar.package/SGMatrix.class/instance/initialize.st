initialization
initialize
	| col |
	rows := OrderedCollection new.
	col := SGVector x: 0 y: 0 z: 0.
	rows
		add: col copy;
		add: col copy;
		add: col copy