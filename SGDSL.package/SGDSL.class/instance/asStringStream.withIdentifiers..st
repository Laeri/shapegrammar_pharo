converting
asStringStream: rule withIdentifiers: tmpList
	| alpha beta alphaToBeta stream idAlpha idBeta from to idListAlpha idListBeta |
	stream := WriteStream on: String new.
	alpha := rule fromShape.
	beta := rule toShape.
	idListAlpha := OrderedCollection new.
	idListBeta := OrderedCollection new.
	tmpList
		do: [ :id | 
			idListAlpha add: (self toSymbolIfNeeded: id).
			idListBeta add: (self toSymbolIfNeeded: id) ].
	idAlpha := idListAlpha readStream.
	idBeta := idListBeta readStream.
	alphaToBeta := rule alphaToBeta.
	stream << 'rule := dsl newRule.' << String cr << String cr.
	alpha points
		ifNotEmpty: [ stream << 'rule alpha ' << String cr.
			alpha points
				doWithIndex: [ :alphaPoint :id | 
					stream << 'point:'.
					stream << idAlpha next << '->(' << alphaPoint x << '@' << alphaPoint y << ')'.
					id = alpha points size
						ifTrue: [ stream << '.' ]
						ifFalse: [ stream << ';' ].
					stream << String cr ].
			stream << String cr ].
	alpha lines
		ifNotEmpty: [ stream << 'rule alpha ' << String cr.
			alpha lines
				doWithIndex: [ :line :i | 
					stream << 'line: '.
					from := idListAlpha at: (alpha points indexOf: line from).
					to := idListBeta at: (alpha points indexOf: line to).
					stream << from << '->' << to.
					i = alpha lines size
						ifTrue: [ stream << '.' ]
						ifFalse: [ stream << ';' ].
					stream << String cr ].
			stream << String cr ].
	beta points
		ifNotEmpty: [ stream << 'rule beta ' << String cr.
			beta points
				doWithIndex: [ :betaPoint :i | 
					stream << 'point:'.
					stream << idBeta next << '->(' << betaPoint x << '@' << betaPoint y << ')'.
					i = beta points size
						ifTrue: [ stream << '.' ]
						ifFalse: [ stream << ';' ].
					stream << String cr ] ].
	beta lines
		ifNotEmpty: [ stream << 'rule beta ' << String cr.
			beta lines
				doWithIndex: [ :line :i | 
					stream << 'line: '.
					from := idListAlpha at: (beta points indexOf: line from).
					to := idListBeta at: (alpha points indexOf: line to).
					stream << from << '->' << to.
					i = beta lines size
						ifTrue: [ stream << '.' ]
						ifFalse: [ stream << ';' ].
					stream << String cr ].
			stream << String cr ].
	alphaToBeta
		ifNotEmpty: [ stream << String cr.
			stream << 'rule map: ' << String cr.
			alphaToBeta associations
				doWithIndex: [ :assoc :i | 
					stream << (idListAlpha at: (alpha points indexOf: assoc key)) << '->'
						<< (idListBeta at: (beta points indexOf: assoc value)).
					i = alphaToBeta associations size
						ifTrue: [ stream << '.' ]
						ifFalse: [ stream << ';' ].
					stream << String cr ] ].
	^ stream