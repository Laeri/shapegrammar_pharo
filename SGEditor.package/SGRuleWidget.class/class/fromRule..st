instance creation
fromRule: aRule
	| widget alpha beta |
	widget := self new.
	widget rule: aRule.
	widget setupWidgets .
	alpha := BlShape fromShape: aRule fromShape.
	beta := BlShape fromShape: aRule toShape.
	alpha
		border:
			(BlBorder builder
				paint: (Color blue alpha: 0.7);
				width: 2;
				build).
	beta
		border:
			(BlBorder builder
				paint: (Color blue alpha: 0.7);
				width: 2;
				build).
	widget addAlpha: alpha.
	widget addBeta: beta.
	^ widget