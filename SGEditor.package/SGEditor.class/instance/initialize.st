initialize-release
initialize
	super initialize.
	ruleApplier := SGShapeRuleApplier new editor: self.
	self createMainRow.