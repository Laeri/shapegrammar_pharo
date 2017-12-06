drawing
drawMorphic: shape
|c l p1 p2 scale ext|

self clear.
scale := 500.
ext := 10.
shape points do: [ :p |
	c := CircleMorph new.
	c color: Color black.
	c bounds: (((p x)*scale)-(ext/4) @ ((p y)*scale)-(ext/4) extent: (ext@ext)).
	c openInWorld.
	 ].
shape lines do: [ :line|
	p1 := line from.
	p2 := line to.
	l := LineMorph from:((p1 x)*scale)@((p1 y)*scale) to: ((p2 x)*scale)@ ((p2 y)*scale)color: (Color blue) width: 2.
		l openInWorld.
	 ]