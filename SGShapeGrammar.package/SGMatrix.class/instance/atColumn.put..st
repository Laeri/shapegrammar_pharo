accessing
atColumn: col put: values
	(rows at: 1) at: col put: (values at: 1).
	(rows at: 2) at: col put: (values at: 2).
	(rows at: 3) at: col put: (values at: 3).