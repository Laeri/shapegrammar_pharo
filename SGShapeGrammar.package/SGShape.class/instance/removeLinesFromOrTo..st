removing
removeLinesFromOrTo: point
| linesToRemove |
linesToRemove := self linesFromOrTo: point.
self lines removeAll: linesToRemove .