accessing
set: matrix
1 to: 3 do: [ :i|
	
	1 to: 3 do:[:j |
		self at: i at: j put: ((matrix at: i at: j) copy).
		 ]]