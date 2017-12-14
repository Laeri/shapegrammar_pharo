accessing
shape
shape := SGShape points: (OrderedCollection newFrom:(idToPoints values)) lines: lines.
shape labels: labels deepCopy.
^ shape.