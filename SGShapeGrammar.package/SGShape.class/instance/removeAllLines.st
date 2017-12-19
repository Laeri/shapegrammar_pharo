removing
removeAllLines
	"Remove all lines without touching points"
	| theLines |
	
	theLines := self lines copy.
	theLines do: [ :aLine | self removeLine: aLine ]