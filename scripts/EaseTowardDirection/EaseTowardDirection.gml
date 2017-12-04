/// @function EaseTowardDirection(target,rate,easing)
///
/// @description Rotates the calling instance towards the target direction,
///			     at a given rate and easing. The larger the easing factor,
///				 the more gradually the turn completes.
///
/// @param target angle to turn towards (degrees), real
/// @param rate maximum turning rate (degrees), real
/// @param easing amount of easing [0..1], real
///
/// GMLscripts.com/license
{
    direction += median(-argument1, argument1, (1-argument2) * angle_difference(argument0, direction));
    return 0;
}