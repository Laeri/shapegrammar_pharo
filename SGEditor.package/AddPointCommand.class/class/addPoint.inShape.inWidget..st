adding
addPoint: p inShape: shape inWidget: widget
|command|

command := self new.
command addedPoint: p.
command shape: shape.
command widget: widget.
^ command.