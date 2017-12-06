adding
addLine: line inShape: shape inWidget: widget
|command|

command := self new.
command addedLine: line.
command shape: shape.
command widget: widget.
^ command.