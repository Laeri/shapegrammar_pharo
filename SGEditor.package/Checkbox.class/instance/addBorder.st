adding
addBorder
	| borderWidth borderColor |
	borderWidth := 4.
	borderColor := Color black.
	self
		addChild:
			(BlLineElement new
				fromAnchor: (BlAbsolutePositionAnchor position: 0 @ 0);
				toAnchor: (BlAbsolutePositionAnchor position: 0 @ self extent y);
				border: (BlBorder paint: borderColor width: borderWidth);
				yourself).
	self
		addChild:
			(BlLineElement new
				fromAnchor: (BlAbsolutePositionAnchor position: 0 @ 0);
				toAnchor: (BlAbsolutePositionAnchor position: self extent x @ 0);
				border: (BlBorder paint: borderColor width: borderWidth);
				yourself).
	self
		addChild:
			(BlLineElement new
				fromAnchor: (BlAbsolutePositionAnchor position: self extent);
				toAnchor: (BlAbsolutePositionAnchor position: self extent x @ 0);
				border: (BlBorder paint: borderColor width: borderWidth);
				yourself).
	self
		addChild:
			(BlLineElement new
				fromAnchor: (BlAbsolutePositionAnchor position: self extent);
				toAnchor: (BlAbsolutePositionAnchor position: 0 @ self extent y);
				border: (BlBorder paint: borderColor width: borderWidth);
				yourself)