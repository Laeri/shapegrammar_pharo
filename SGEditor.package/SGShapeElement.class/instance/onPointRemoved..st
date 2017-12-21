event handling
onPointRemoved: anAnnouncement
	self removePoint: anAnnouncement point.
	shape points size = 0 ifTrue:[
		self layout: BlLayout new.
		].