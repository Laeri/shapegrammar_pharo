utility
allLinesFromOrTo: point
^ lines select:[:line| (line from = point) or: (line to = point)]