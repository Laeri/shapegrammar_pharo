as yet unclassified
recreateDirectoryOfFile: aFile
aFile asFileReference parent exists
		ifFalse: [ [aFile asFileReference parent createDirectory] on: DirectoryDoesNotExist do:[:anEx|
				anEx reference asFileReference parent createDirectory.
				]]
		ifTrue: [ aFile asFileReference parent deleteAll.
			[aFile asFileReference parent createDirectory] on: DirectoryDoesNotExist do:[:anEx|
			anEx reference asFileReference parent createDirectory.
			].
			
			 ].