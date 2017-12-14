as yet unclassified
parentToShapePoint: point snapToGrid: aBool
|widgetPos|

widgetPos := self globalPointToLocal: point.

aBool ifTrue:[
	^ (self snapToGrid: widgetPos) / self extent.
	] ifFalse:[
	^ widgetPos / self extent].