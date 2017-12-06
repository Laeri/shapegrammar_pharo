as yet unclassified
createRuleFromToWidgetFromRule: rule
	| border ruleRep blFromShape blToShape |
	ruleRep := BlElement new
		layout: BlLinearLayout horizontal;
		background: Color yellow.
	border := BlBorder builder
		paint: Color black;
		width: 5;
		build.
	ruleRep border: border.
	ruleRep
		constraintsDo: [ :c | 
			c horizontal matchParent.
			c vertical matchParent ].
	blFromShape := BlShape fromShape: rule fromShape.
	blFromShape 
		constraintsDo: [ :c | 
			c horizontal matchParent.
			c vertical matchParent ].
	ruleRep addChild: blFromShape .
	blToShape := BlShape fromShape: rule toShape.
	blToShape 
		constraintsDo: [ :c | 
			c horizontal matchParent.
			c vertical matchParent ].
	ruleRep addChild: blToShape .
	"
	blFromShape addEventHandlerOn: BlDragEvent   do: [:e| rule update  ]. 
	blToShape addEventHandlerOn: BlDragEvent  do: [:e|  rule update]. 
	"
^ ruleRep.