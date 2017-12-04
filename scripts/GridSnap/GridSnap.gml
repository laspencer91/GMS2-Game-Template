/// @description Takes a value and snaps it to a grid position.
/// @function GridSnap(value, gridSize)
/// @param real_value To Snap
/// @param snap_value Grid Size

//	Divide, floor, and multiply to snap.
//  http://www.seabassandgazellestudios.com/gml-scripts.html

return floor(argument0 / argument1) * argument1;