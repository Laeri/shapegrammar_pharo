accessing
filterIntersections: matches shape: shape toShape: toShape
	| tmpP1 tmpP2 localToBaseMatrix subToLocalMatrix tmpP3 tmpP4 |
	 ^ matches
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
									tmpP3 := baseLine from.
									tmpP4 := baseLine to.
									match betaToBase keysAndValuesDo: [:betaP :baseP|
										"If a base point was moved, use the new moved one (transformed from beta to base coordinate system"
											(baseP = baseLine from) ifTrue: [
												tmpP3 := betaP deepCopy.
												match subToLocalMatrix transform: tmpP3.
												match baseToLocalMatrix getInv transform: tmpP3.
												].
											(baseP = baseLine to) ifTrue:[
												tmpP4 := betaP deepCopy .
												match subToLocalMatrix transform: tmpP4.
												match baseToLocalMatrix getInv transform: tmpP4.
												].
										 ]. 
									SGLine
										doesLineFrom: tmpP1
										to: tmpP2
										intersectWithLineFrom: tmpP3
										to: tmpP4 ]. ] ] 