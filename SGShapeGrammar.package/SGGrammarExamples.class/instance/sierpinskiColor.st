classics
sierpinskiColor
<gtExample>
	| grammar rule labelAlpha label1 label2 label3 label4 |
	grammar := SGGrammarBuilder new.
	rule := grammar newRule.
	rule alpha
		points:
			{(#a -> (0 @ 0)).
			(#b -> (1 @ 0)).
			(#c -> (0.5 @ 0.75 sqrt))}.
	rule alpha lines: {#a -> #b. #b ->#c. #c -> #a}.
	labelAlpha := SGPolygonLabel new.
	labelAlpha polygonPoints: { rule alpha pointOfId: #a. rule alpha pointOfId: #b. rule alpha pointOfId: #c }.
	label1 := SGPolygonLabel new.
	label2 := SGPolygonLabel new.
	label3 := SGPolygonLabel new.
	label4 := SGPolygonLabel new.
	rule beta
		points:
			{(#a -> (0 @ 0)).
			(#b -> (1 @ 0)).
			(#c -> (0.5 @ 0.75 sqrt)).
			(#d -> (0.5 @ 0)).
			(#e -> (0.75 @ (0.5 squared - 0.25 squared) sqrt)).
			#f -> (0.25@(0.5 squared - 0.25 squared) sqrt)}.
	rule beta lines: {#a ->#d. #d -> #b. #b -> #e. #e -> #c. #c -> #f. #f -> #a.
	#d -> #e. #e -> #f. #f -> #d
	}.
	rule map: {#a -> #a. #b -> #b. #c -> #c}.
	^ grammar build