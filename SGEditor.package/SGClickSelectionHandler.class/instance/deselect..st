select / deselect
deselect: aPoint
aPoint background: self unselectedColor.
firstSelected = aPoint ifTrue:[
		firstSelected := secondSelected .
		secondSelected := nil.
	].
secondSelected = aPoint ifTrue:[
		secondSelected := nil.
	].