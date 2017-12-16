I represent a filter which removes elements from a collection of SShapeMatches.

I can be configured to filter out SGShapeMatches based on certain parameters.
Any matches not conforming to those parameters are removed and only those passing will be returned.
I will be used by SGRule in order to filter subshape matches which should not be applied by the given rule.