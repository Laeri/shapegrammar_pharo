instance creation
fromRule: aRule
	| widget alpha beta |
	widget := self new.
	widget rule: aRule.
	widget setupWidgets .
	alpha := SGShapeWidget alpha: aRule alpha.
	beta := SGShapeWidget alpha: aRule beta.
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
	alpha constraintsDo: [ :c | 
			c horizontal matchParent.
			c vertical matchParent ].
		beta constraintsDo: [ :c | 
			c horizontal matchParent.
			c vertical matchParent ].
		
	^ widget