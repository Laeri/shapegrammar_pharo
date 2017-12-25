instance creation
newGeometryOf: aSGShapeMatch presentIn: aSGShape givenRule: aSGRule 
	|betaToLocal localToBase atmpVector newToBase newToBaseLines |

	betaToLocal := aSGShapeMatch subToLocalMatrix .
	localToBase := aSGShapeMatch baseToLocalMatrix getInv.
	atmpVector := SGVector new.
	newToBase := Dictionary new.
	newToBaseLines := Dictionary new.
	aSGRule addedPoints do:[:aNewPoint|
			atmpVector x: aNewPoint x y: aNewPoint y z: 1.
			betaToLocal transform: atmpVector.
			localToBase transform: atmpVector.
			aSGShape points detect: [ :aBasePoint|
					(atmpVector dist2D: aBasePoint) < SGMatchSelector equalityRange
				 ] ifFound:[:aMappedPoint|
					newToBase at: aNewPoint put: aMappedPoint.
				].
		].
	aSGShapeMatch betaToBase addAll: newToBase.
	aSGRule addedLines do:[:aNewLine|
			aSGShape lines detect:[:aBaseLine|
					|tmpSGLine|
					tmpSGLine := SGLine from: (aSGShapeMatch betaToBase at: (aNewLine from) ifAbsent: [SGVector new]) to: (aSGShapeMatch betaToBase  at: (aNewLine to) ifAbsent:[SGVector new]).
					tmpSGLine samePointsAs: aBaseLine 
				] ifFound:[:aMappedLine|
					newToBaseLines at: aNewLine put: aMappedLine.
				].
		].