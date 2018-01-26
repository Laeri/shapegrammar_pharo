wadocument
waTriangleInlay
<script: 'SGImageExamples new waTriangleInlay'>
| builder ruleBuilder rule alphaShape betaShape |
builder := SGImageBuilder new.
ruleBuilder := SGRuleBuilder new.
ruleBuilder alpha
			points: {(#a -> (0 @ 0)). (#b -> (1 @ 0)). (#c -> (1 @ 1))}.
ruleBuilder alpha
			lines:{(#a -> #b). (#b -> #c). (#c -> #a)}.
ruleBuilder beta 
			points: {(#a -> (0 @ 0)). (#b -> (1 @ 0)). 
						(#c -> (1 @ 1)). (#d -> (0.7 @ 0.3))}.
ruleBuilder beta 
			lines: {(#a -> #b). (#b -> #c). (#c -> #a). 
						(#a -> #d). (#b -> #d). (#c -> #d)}.
ruleBuilder map: {(#a -> #a). (#b -> #b). (#c -> #c)}.
rule := ruleBuilder build.
alphaShape := SGShapeElement shape: rule alpha.
betaShape := SGShapeElement shape: rule beta.
builder save: alphaShape to: 'triangle_inlay_alpha'.
builder save: betaShape to: 'triangle_inlay_beta'.