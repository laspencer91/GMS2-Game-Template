/// @description Returns the id of the nth nearest instance of an object
///				  to a given point or noone if none is found.
/// @function InstanceNthNearest(x,y,obj,n)
///
/// @param x real
/// @param y real
/// @param obj object_index
/// @param n proximity
//
// Example InstanceNthNearest(x, y, Enemy, 5);  Will resturn the 5th nearest enemy to the current object x, y coord
/// GMLscripts.com/license
{
    var pointx,pointy,object,n,list,nearest;
    pointx = argument0;
    pointy = argument1;
    object = argument2;
    n = argument3;
    n = min(max(1,n),instance_number(object));
    list = ds_priority_create();
    nearest = noone;
    with (object) ds_priority_add(list,id,distance_to_point(pointx,pointy));
    repeat (n) nearest = ds_priority_delete_min(list);
    ds_priority_destroy(list);
    return nearest;
}