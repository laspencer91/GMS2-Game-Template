/// @function IsInLineOfSight(lookerX, lookerY, targetX, targetY, maxSightRange, lookDirection, fieldOfView, sightBlockerObj)
/// @description Returns true or false if one target can see another target. Essentially
///              This function first checks if the looker and target are withing the maxRange
///              of each other. If not returns false. If they are then it will determine if the
///              target is withing the field of view of the looker. If all of these are true this
///              function will return true.
///
/// @param lookerX real
///				X position of the place to check from
/// @param lookerY real
///				Y position of the place to check from
/// @param targetX real
///				X position of target to check line of sight to
/// @param targetY real
///				Y position of target to check line of sight to
/// @param maxRange real
///				Max Sight range. A distance between looker and target greater than this wont be seen
/// @param facingDir angle
///				The current facing direction of the Looker. Ex: If enemy is performing the check. The enemies direction
/// @param fieldOfView angle
///				The maximum field of view from the facingDir. Ex: 90 will check 45 degrees in both directions from facingDir
/// @param sightBlocker object_index
///				An object_index that can block sight. IF you have multiple types of blockers, Use a SightBlocker parent object
///
///	Example:	if (IsInLineOfSight(x, y, Player.x, Player.y, 100, image_angle, 90, objSightBlocker))
///					targetSpotted = true;

var _lookerX		 = argument0;
var _lookerY		 = argument1;
var _targetX		 = argument2;
var _targetY		 = argument3;
var _maxRange        = argument4;
var _facingDirection = argument5;
var _fieldOfView	 = argument6;
var _sightBlocker	 = argument7;

// If target is too far away or a sight blocker is in the way return false
if (collision_line(_lookerX, _lookerY, _targetX, _targetY, _sightBlocker, false, true) || 
	point_distance(_lookerX, _lookerY, _targetX, _targetY) > _maxRange)
		return false;

// Calculate Angles
_angleToTarget = point_direction(_lookerX, _lookerY, _targetX, _targetY);

// Super secret formula to get the difference between two angles normalized to be
// between 0 or 180. (Solves issue that 360 and 0 are the same angle)
var _angleDifference = 180 - abs(abs(_angleToTarget - _facingDirection) - 180);

// Cut given fov in half. This is the angle we check against
var _halfFov = _fieldOfView / 2;

return (_angleDifference <= _halfFov);