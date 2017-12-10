instance creation
fromText: text onToggleDo: aBlock
|widget|
widget := NamedCheckbox new.
widget text: text.
widget onToggleDo: aBlock.
^ widget.