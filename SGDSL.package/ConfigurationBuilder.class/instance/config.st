operations
config
|config|
config := SGConfiguration new.
config grammar: (self grammar) grammar.
config shape: baseBuilder shape.
^ config.