operations
build
|config|
config := SGConfiguration new.
config grammar: (self grammar) build.
config shape: baseBuilder build.
^ config.