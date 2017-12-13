comparing
samePointsAs: other
^ ((self from = other from) and: (self to = other to)) or: ((self from = other to) and: (self to = other from)).