accessing
pointAt: pos inRange: range
self points do: [ :p|
		((p dist2D: pos) <= range) ifTrue:[^ p].
	 ].
^ nil.