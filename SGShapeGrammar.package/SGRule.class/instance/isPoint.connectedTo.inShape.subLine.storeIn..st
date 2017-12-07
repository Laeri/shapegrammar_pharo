testing
isPoint: p1 connectedTo: p2 inShape: shape subLine: subLine storeIn: lineMatching
|lineFound connections lines|
lines := shape lines.
connections := lines select: [ :line| (((line from)  = p2) and: ((line to) = p1)) or: (((line to)  = p2) and: ((line from) = p1)) ].
(connections size > 1) ifTrue:[self error: 'More than one matching found'].
connections isEmpty ifTrue: [ ^ false ].
lineFound := connections at: 1.
lineMatching at: subLine put: lineFound.
^ (connections isNotEmpty )