as yet unclassified
applyCurrent
match ifNil:[
currentRule applyOn: shape] ifNotNil:[ currentRule applyOn: shape givenMatch: match].
match := nil.
self invalidate.