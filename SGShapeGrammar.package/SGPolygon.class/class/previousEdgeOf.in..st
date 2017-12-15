as yet unclassified
previousEdgeOf: anEdge in: sortedEdges
| index |
index := sortedEdges indexOf: anEdge .
index = 1 ifTrue:[index := sortedEdges size] ifFalse:[index := index -1]. 
^ sortedEdges at: index.
