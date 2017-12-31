instance creation
fromShape: shape1 toShape: shape2
|rule|
rule := self new.
rule alpha: shape1; beta: shape2.
rule update.
^ rule
