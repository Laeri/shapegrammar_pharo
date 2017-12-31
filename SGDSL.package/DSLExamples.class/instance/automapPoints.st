as yet unclassified
automapPoints
<gtExample>
| rule |
rule := RuleBuilder new.
rule alpha points: { 1@1. 2@3. 4@4 }.
rule alpha lines: {  }.
rule beta points: { 1@1. 3@3. 2@3. 4@4  }.
rule beta lines: {  }.
rule automap.
rule := rule rule.
^ rule