arithmetic
getInv
	|mat det|
	mat := self getAdj .
	det := self det.
	mat mul: (1/det).
	^ mat