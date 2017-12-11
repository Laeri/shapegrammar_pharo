grammars
triangleRemvoeLines
|config grammar rule|
config := SGDSL new config.
grammar := config grammar.
grammar name: 'twoLinesToOne'.
rule := grammar newRule.
rule alpha points: {#a->(0.1@0.1). #b->(0.1@0.9). #c->(0.9@0.9)  }.
rule alpha lines: {#a->#b . #b->#c . #a->#c}.

rule beta points: {#a->(0.1@0.1). #b->(0.1@0.9). #c->(0.9@0.9)}.
rule beta lines: { }.
rule map: {#a->#a. #b->#b . #c->#c }. 
^ config create.