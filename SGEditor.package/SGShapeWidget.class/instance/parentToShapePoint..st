as yet unclassified
parentToShapePoint: point
|widgetPos|

widgetPos := self globalPointToLocal: point.

snapToGrid ifTrue:[
	^ (self snapToGrid: widgetPos) / self extent.
	] ifFalse:[
	^ widgetPos / self extent].