as yet unclassified
move: point from: oldPos to: newPos inWidget: widget
|command|

command := self new.
command movedPoint: point.
command oldPosition: oldPos.
command newPosition: newPos.
command widget: widget.
^ command.