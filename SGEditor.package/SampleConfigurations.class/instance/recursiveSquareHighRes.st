config
recursiveSquareHighRes
<gtExample>
|config rule offset grammar |
config := SGConfigurationBuilder new.
grammar := config grammar.
rule := grammar newRule.
offset := 0.03.
rule alpha points: {#a -> (0@0). #b -> (1@0). #c -> (1@1). #d -> (0@1)}.
rule alpha lines: { #a -> #b. #b -> #c. #c -> #d. #d -> #a}.
rule beta points: {#a -> (0@0). #b -> ((1 - offset)@0). #c -> (1@0). #d -> (1@(1-offset)). #e -> (1@1). #f -> (offset@1). #g -> (0@1). #h -> (0@offset) }.
rule beta lines: {#a -> #b. #b -> #c. #c -> #d. #d -> #e. #e -> #f. #f -> #g. #g -> #h. #h -> #a. #b -> #d. #d -> #f. #f -> #h. #h -> #b}.
rule map: {#a -> #a. #b -> #c. #c -> #e. #d -> #g  }.
config :=  config build.
config shape: SGShapeExamples new square.
^ config