comparing
samePointsAs: other
(self points size = other points size) ifFalse:[^ false].
^ self points allSatisfy: [ :aPoint|
		other points includes: aPoint.
	 ]