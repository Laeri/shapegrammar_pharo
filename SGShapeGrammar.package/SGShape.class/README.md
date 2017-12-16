I am a shape in a 2D plane.

I hold vertices called SGVectors, which define points in 2D and I have lines referencing those points.
Therefore any query about neighbouring edges, faces or vertices is not done in a performant way.
The reason for this is due to frequent changes on the geometry (by use of SGRule application), it was
easier to implement this way and removing additional overhead changing the internal representation.

Adding Points/Lines, removing Points/Lines or moving points around is simple this way, no additional calculations
have to be done (except removing lines going to or from a removed Point).