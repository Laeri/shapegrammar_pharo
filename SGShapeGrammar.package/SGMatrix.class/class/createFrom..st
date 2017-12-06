instance creation
createFrom: values
	1 to: 3 do: [ :row |
		1 to: 3 do: [  :column |
			self at: row at: column put: (values at: (row-1)*3 +column)
			 ] ]