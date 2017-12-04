/// @description Returns a list data structure populated with the ids of instances 
///			     colliding with a given rectangle, or noone if no instances found.
/// @function CollisionRectangleList(x1, y1, x2, y2, obj, prec, notme)
/// @arg x1
/// @arg y1
/// @arg x2
/// @arg y2
/// @arg obj
/// @arg prec
/// @arg notme
/// @returns A ds_list of instances that collide with the given rectangle

var x1, y1, x2, y2, obj, prec, notme, dsid, dsmask, i;
x1    = argument0;
y1    = argument1;
x2    = argument2;
y2    = argument3;
obj   = argument4;
prec  = argument5;
notme = argument6;
dsid  = ds_list_create();

i = collision_rectangle(x1, y1, x2, y2, obj, prec, false);
while ( i != noone )
{
	ds_list_add(dsid, i);
	instance_deactivate_object(i);
	i = collision_rectangle(x1, y1, x2, y2, obj, prec, false);
}

if (!ds_list_empty(dsid))
{
	var list_size = ds_list_size(dsid);
	for ( i = 0; i < list_size; i ++; )
	{
		instance_activate_object(dsid[| i]);
	}
}

return dsid;