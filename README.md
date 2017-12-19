Run this script for installation:

```Smalltalk
Iceberg enableMetacelloIntegration: true.
Metacello new
   baseline: 'ShapeGrammar';
   repository: 'github://hexaquat/shapegrammar_pharo';
   load
```
