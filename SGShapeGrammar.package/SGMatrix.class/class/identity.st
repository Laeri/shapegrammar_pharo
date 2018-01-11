instance creation
identity
|identityMatrix|
identityMatrix := SGMatrix new.
identityMatrix at: 1 at: 1 put: 1.
identityMatrix at: 2 at: 2 put: 1.
identityMatrix at: 3 at: 3 put: 1.
^ identityMatrix .