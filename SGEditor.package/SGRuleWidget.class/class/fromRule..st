instance creation
fromRule: rule
	| widget border alpha beta |
	widget := self new.
	alpha := BlShape fromShape: rule fromShape.
	beta := BlShape fromShape: rule toShape.
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