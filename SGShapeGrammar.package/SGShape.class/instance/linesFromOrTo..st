utility
linesFromOrTo: point
^ lines select:[:line| (line from = point) or: (line to = point)]