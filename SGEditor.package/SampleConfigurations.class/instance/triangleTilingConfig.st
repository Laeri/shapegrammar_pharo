config
triangleTilingConfig
<gtExample> 
| dsl config grammar rule shape |
dsl := SGDSL new.
config := dsl config.
grammar := config grammar.
rule := grammar newRule.
rule alpha points: { #a -> (0.25@0). #c ->(0@0.5). #d -> (0.5@0.5) }.
rule alpha lines: { #a -> #c. #a -> #d. #c -> #d }.
rule beta points: { #a -> (0.25@0). #b -> (0.75@0) . #c ->(0@0.5). #d -> (0.5@0.5) }.
rule beta lines: { #a -> #c. #a -> #d. #c -> #d. #a -> #b. #b -> #d }.
rule map:{#a -> #a. #c -> #c . #d -> #d}.
shape := config shape.
shape points: { #a -> (0.25@0). #c ->(0@0.5). #d -> (0.5@0.5) }.
shape lines: { #a -> #c. #a -> #d. #c -> #d }.
config := config grammar.
^ config.