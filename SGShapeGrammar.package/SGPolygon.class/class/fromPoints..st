instance creation
fromPoints: points
|p|
p := SGPolygon new.
p points: points.
^ p.