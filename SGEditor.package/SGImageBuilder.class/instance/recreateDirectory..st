as yet unclassified
recreateDirectory: aPath
	| fileRef |
	fileRef := aPath asFileReference.
	fileRef exists
		ifFalse: [ fileRef createDirectory ]
		ifTrue: [ fileRef deleteAll.
			fileRef createDirectory ]