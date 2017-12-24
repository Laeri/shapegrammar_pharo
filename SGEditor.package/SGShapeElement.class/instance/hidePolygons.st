drawing-polygons
hidePolygons
|polygons|
showPolygons := false.
polygons := self findPolygons.
self removeChildren: polygons.