utility
getLineFrom: p1 to: p2
|tmp|
tmp := lines select: [ :line| ((line from = p1) and: (line to = p2)) or: ((line from = p2) and: (line to = p1)) ].
(tmp size > 1) ifTrue:[self error: 'more than one line found'].
(tmp size  ~= 1) ifTrue:[self error: 'no line found'.].
^ tmp at: 1.