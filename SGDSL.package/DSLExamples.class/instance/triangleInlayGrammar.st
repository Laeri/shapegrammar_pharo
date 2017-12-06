TriangleInlayGrammar
triangleInlayGrammar
| dsl rule grammar |

dsl := SGDSL new.
rule := dsl newRule.
rule alpha point: #a -> (0@0); point: #b -> (1@0); point: #c -> (1@1).
rule alpha line: #a->#b; line: #b->#c; line:#c->#a.

rule beta point: #a -> (0@0); point: #b -> (1@0); point: #c -> (1@1).
rule beta line: #a->#b; line: #b->#c; line:#c->#a.
rule map: #a -> #a; map: #b->#b; map: #c->#c.
grammar := dsl grammar.
^ grammar.