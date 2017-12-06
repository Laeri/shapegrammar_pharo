instance creation
fromPoint: point
| tmp |

	tmp := SGVector new.
	tmp
		x: point x;
		y: point y;
		z: 1.
		^ tmp