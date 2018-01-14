tiling
hexagonTilingConfig
<gtExample>  
|config|
config := SGConfiguration new.
config shape: SGShapeExamples new hexagon.
config grammar: SGGrammarExamples new hexagonTiling.
^ config