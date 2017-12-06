removing
removeLine: line fromShape: shape inWidget: widget
|command|

command := self new.
command removedLines add: line.
command shape: shape.
command widget: widget.
^ command.