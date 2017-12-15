as yet unclassified
connectionOf: aPoint
(from = aPoint) ifTrue:[^ to].
(to = aPoint) ifTrue:[^ from].
self error: 'point is not in line'