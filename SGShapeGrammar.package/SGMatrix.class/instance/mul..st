arithmetic
mul: val
|tmp|
1 to: 3 do: [:i| 
	1 to: 3 do: [ :j|
		tmp := self at: i at: j.
		self at: i at: j put: (tmp * val).
		 ]
	 ]