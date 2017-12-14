instance creation
fromShapeDelta: shapeDelta inWidget: widget
|command |
command := self new.
command addedPoints: shapeDelta addedVertices .
command addedLines: shapeDelta addedLines.
command removedPoints: shapeDelta removedVertices .
command removedLines: shapeDelta removedLines.
command newPositionsDict: shapeDelta movePointToDict .
command shape: shapeDelta shape.
command widget: widget.
command labelTransforms: shapeDelta labelTransforms.
command oldLabels: shapeDelta removedLabels .
command addedLabels: shapeDelta addedLabels .
^ command.
