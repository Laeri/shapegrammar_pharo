hook
applyModeOnShape: shape withUsedMatch: matchUsed
"For aging score"
"increase age of unused points"
shape points do: [ :p | p age: p age + 1 ].
"reset age of used points"
matchUsed betaToBase valuesDo: [ :val | val age: 0 ].
