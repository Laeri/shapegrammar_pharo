accessing
rule
|pointMap|
pointMap := Dictionary new.
map keysAndValuesDo: [ :alphaId :betaId|
		pointMap at: (alpha pointOfId: alphaId ) put: (beta pointOfId: betaId ).
	 ].
rule := SGRule fromShape: alpha shape toShape: beta shape  mapping: pointMap.
^ rule.
