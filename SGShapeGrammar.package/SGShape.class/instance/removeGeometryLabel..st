adding
removeGeometryLabel: aLabel
geometryLabels remove: aLabel ifAbsent:[Transcript show: 'Tried to remove label which is not present'; cr.].