arithmetic
getAdj
	| mat |
	mat := SGMatrix new.
	mat m11: ((self m22 * self m33) - (self m23 * self m32)).
	mat m12: ((self m13 * self m32) - (self m12 * self m33)).
	mat m13: ((self m12 * self m23) - (self m13 * self m22)).
	
	mat m21: ((self m23 * self m31) - (self m21 * self m33)).
	mat m22: ((self m11 * self m33) - (self m13 * self m31)).
	mat m23: ((self m13 * self m21) - (self m11 * self m23)).
	
	mat m31: ((self m12 * self m32) - (self m22 * self m31)).
	mat m32: ((self m12 * self m31) - (self m11 * self m32)).
	mat m33: ((self m11 * self m22) - (self m12 * self m21)).
	^ mat