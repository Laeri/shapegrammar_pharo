as yet unclassified
removePoint: point fromShape: shape inWidget: widget
|command|

command := self new.
command removedPoints add: point.
command shape: shape.
command widget: widget.
^ command.