removing
removeLinesFromOrTo: point
| linesToRemove |
linesToRemove := self allLinesFromOrTo: point.
self lines removeAll: linesToRemove .