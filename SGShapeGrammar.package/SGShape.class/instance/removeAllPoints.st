removing
removeAllPoints
	"Remove all points and all lines connected to those points"
	| thePoints |
	
	thePoints := self points copy.
	thePoints do: [ :aPoint | self removePoint: aPoint ]