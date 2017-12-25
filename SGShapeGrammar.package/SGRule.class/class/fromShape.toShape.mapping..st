as yet unclassified
fromShape: shape1 toShape: shape2 mapping: mapping
|rule|
rule := self new.
rule alpha: shape1; beta: shape2; alphaToBeta: mapping.
rule update.
^ rule
