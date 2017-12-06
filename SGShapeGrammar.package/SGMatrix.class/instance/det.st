arithmetic
det
	^ self m11 * self m22 * self m33 + (self m12 * self m23 * self m31)
		+ (self m21 * self m32 * self m13) - (self m12 * self m21 * self m33)
		- (self m13 * self m22 * self m31) - (self m23 * self m32 * self m11)