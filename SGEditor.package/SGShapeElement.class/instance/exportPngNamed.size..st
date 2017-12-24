export
exportPngNamed: aName size: aSize
|exportElement exported folderPath fileEnding unusedIndex filePath |
exportElement := SGShapeElement new.
exportElement shape: self shape.
"exportElement border: (BlBorder paint: Color black width: 1)."
exportElement size: aSize.
unusedIndex := 0.
exported := false.
folderPath := '../Examples/'.
fileEnding := '.png'.
[ exported] whileFalse: [
	filePath := folderPath , aName , '_', unusedIndex printString ,fileEnding .
	[exportElement asSpartaForm writePNGFileNamed: filePath.
		exported := true.
	] on: FileExistsException do:[
		unusedIndex := unusedIndex + 1.
	]
	].
