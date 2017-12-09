accessing
snapToGrid: position
^ (((position x / self gridWidth) rounded) @ ((position y / self gridHeight) rounded)) * (self gridWidth @ self gridHeight).