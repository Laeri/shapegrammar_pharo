as yet unclassified
onSeed: aSeed
	| selector |
	selector := SGRandomSelector new.
	selector seed: aSeed.
	^ selector