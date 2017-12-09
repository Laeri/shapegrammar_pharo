testing
arePoints: points sameAsIn: bin
|testPoints|
testPoints := bin first matchedBasePoints.

^ (points allSatisfy: [:p| testPoints includes: p]) and: (points size = testPoints size)
