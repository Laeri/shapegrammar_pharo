instance creation
createPolygon: aSGPolygon
	<return: #BlElement>
	| polygon blPolygon fillColor|
	polygon := BlPolygon new.
	polygon
		vertices: (aSGPolygon points collect: [ :aPolygonPoint | 
			|blPoint blPointSize|
			blPoint := (self findPoints: aPolygonPoint) first.
			blPointSize := blPoint width @ blPoint height.
			blPointSize := (blPointSize /2) roundDownTo: 1.
			blPoint position + blPointSize
			 ]).
		
	
		fillColor := Color red alpha: 0.5. "Default fill color"
		shape labels detect: [ :label| 
						label polygon samePointsAs: aSGPolygon.
					] ifFound: [ :label| fillColor  := label color.]. 
		blPolygon := BlElement new geometry: polygon; background: fillColor; yourself.
		blPolygon userData at: #shapeGrammarPolygon put: aSGPolygon.
	^ blPolygon.