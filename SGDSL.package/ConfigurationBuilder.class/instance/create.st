operations
create
|config|
config := SGConfiguration new.
config grammar: (self grammar) create.
config shape: baseBuilder shape.
^ config.