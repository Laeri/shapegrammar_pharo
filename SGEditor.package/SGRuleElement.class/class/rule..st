instance creation
rule: aRule
	| widget alpha beta alphaScalable betaScalable |
	widget := self new.
	widget rule: aRule.
	widget setupWidgets.
	
	alpha := SGShapeElement shape: aRule alpha.
	alpha padding: (BlInsets all: 10).
	alpha margin: (BlInsets all: 20).
	alpha background: Color white.

	beta := SGShapeElement shape: aRule beta.
	beta padding: (BlInsets all: 10).
	beta margin: (BlInsets all: 10).
	beta background: Color white.

	alphaScalable := BlScalableElement new.
	alphaScalable constraintsDo: [ :c | 
			c horizontal matchParent.
			c vertical matchParent ].
	alphaScalable contentElement: alpha.
	
	betaScalable := BlScalableElement new.
	betaScalable constraintsDo: [ :c | 
			c horizontal matchParent.
			c vertical matchParent ].
	betaScalable contentElement: beta.

	widget addAlpha: alphaScalable.
	widget addBeta: betaScalable.
	alpha constraintsDo: [ :c | 
			c horizontal matchParent.
			c vertical matchParent ].
		beta constraintsDo: [ :c | 
			c horizontal matchParent.
			c vertical matchParent ].
		
	^ widget