comparing
connectsSamePointsAs: other
^(self from = other from) ifTrue: [(self to = other to)]
ifFalse: [ (self from = other to) ifTrue:[ self to = other from]]