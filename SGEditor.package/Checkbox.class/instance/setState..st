initialization
setState: aBool
	checked := aBool.
	aBool
		ifTrue: [ self background: Color white.
			self
				addChild:
					(BlLineElement new
						fromAnchor: (BlAbsolutePositionAnchor position: 0 @ 0);
						toAnchor: (BlAbsolutePositionAnchor position: self extent);
						border: (BlBorder paint: Color red width: 4);
						yourself).
			self
				addChild:
					(BlLineElement new
						fromAnchor: (BlAbsolutePositionAnchor position: self extent x @ 0);
						toAnchor: (BlAbsolutePositionAnchor position: 0 @ self extent y);
						border: (BlBorder paint: Color red width: 4);
						yourself) ]
		ifFalse: [ self background: Color white.
			self removeChildren ].
	onToggleBlock ifNotNil: [ onToggleBlock cull: checked ].
	self addBorder