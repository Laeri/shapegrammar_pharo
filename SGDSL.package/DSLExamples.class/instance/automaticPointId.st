shapeExamples
automaticPointId
<gtExample>
| shape |
shape := SGShapeBuilder new
				points: { (0@0). (1@0). (1@1) };
				lines: { 1 -> 2. 2 -> 3. 3 -> 1 };
				build.
^ shape		