instance creation
fromShape: shape1 toShape: shape2 mapping: mapping
|rule|
rule := self new.
rule fromShape: shape1; toShape: shape2; alphaToBeta: mapping.
rule update.
^ rule
