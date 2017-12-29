grammars
triangleInlayWithLabels
| dsl rule grammar config label shape polygonPoints label1 label2 label3 alpha beta |


config := SGDSL new config.
grammar := config grammar.
grammar name: 'triangleWithLabels'.
rule := grammar newRule.
rule alpha point: #a -> (0@0); point: #b -> (1@0); point: #c -> (1@1).
rule alpha line: #a->#b; line: #b->#c; line:#c->#a.
rule beta point: #a -> (0@0); point: #b -> (1@0); point: #c -> (1@1); point: #d ->(0.5@0.25).
rule beta line: #a->#b; line: #b->#c; line:#c->#a; line:#a->#d; line: #b->#d; line: #c->#d.
rule map: #a -> #a; map: #b->#b; map: #c->#c.
config :=  config grammar.
grammar := config grammar.
rule := config grammar rules first.
alpha := rule alpha.
beta := rule beta.
label := SGPolygonLabel new.
polygonPoints := OrderedCollection new addAll: alpha points; yourself.
label polygonPoints: polygonPoints.
"alpha addLabel: label."

label1 := SGPolygonLabel new.
label2 := SGPolygonLabel new.
label3 := SGPolygonLabel new.
^ config.

