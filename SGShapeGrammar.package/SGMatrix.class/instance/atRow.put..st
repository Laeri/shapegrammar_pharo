accessing
atRow: row put: values
	(rows at: row) at: 1 put: (values at: 1).
	(rows at: row) at: 2 put: (values at: 2).
	(rows at: row) at: 3 put: (values at: 3).