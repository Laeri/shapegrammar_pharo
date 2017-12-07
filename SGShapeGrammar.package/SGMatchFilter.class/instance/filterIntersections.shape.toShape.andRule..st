accessing
filterIntersections: matches shape: shape toShape: toShape andRule: rule
	| tmpP1 tmpP2 localToBaseMatrix subToLocalMatrix |
	filterIntersections 
		ifTrue: [ ^ matches
				reject: [ :match | 
					toShape lines
						anySatisfy: [ :toLine | 
							tmpP1 := toLine from deepCopy.
							tmpP2 := toLine to deepCopy.
							localToBaseMatrix := match baseToLocalMatrix getInv.
							subToLocalMatrix := match subToLocalMatrix.
							subToLocalMatrix transform: tmpP1.
							subToLocalMatrix transform: tmpP2.
							localToBaseMatrix transform: tmpP1.
							localToBaseMatrix transform: tmpP2.
							shape lines
								anySatisfy: [ :baseLine | 
									SGLine
										doesLineFrom: tmpP1
										to: tmpP2
										intersectWithLineFrom: baseLine from
										to: baseLine to ] ] ] ]
		ifFalse: [ ^ matches ]