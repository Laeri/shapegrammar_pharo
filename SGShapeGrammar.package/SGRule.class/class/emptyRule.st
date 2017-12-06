as yet unclassified
emptyRule
|rule|
rule := self new.
rule fromShape: SGShape new; toShape: SGShape new; alphaToBeta: Dictionary new.
rule update.
^ rule