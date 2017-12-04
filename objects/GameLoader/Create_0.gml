/// @description Initialize New Game Persistent Objects
/// IF you would like some data to not be erased or change between rooms 
/// initialize its creation by setting its parent to Singleton. It will ensure that 
/// the object get set to be persistent (NOT ERASED ON ROOM CHANGE).

singletons = ds_list_create();

if (room != LoadingRoom)
{
	instance_destroy();
	exit;
}

var i = 0;

// Loop through our resource tree and find all Singleton objects to be created
while (true)
{
    if (!object_exists(i)) 
		break;
	
    if (object_is_ancestor(i, Singleton))
	{
		ds_list_add(singletons, i);
	}
	
    i++;
}

// Initialize All of Our Singletons, then goto next room :) (GamePlay)
for (var i = 0; i < ds_list_size(singletons); i++)
{
	var newManager = instance_create_layer(0, 0, "Instances", ds_list_find_value(singletons, i));
		
	if (!variable_instance_exists(newManager, "correctlyInitialized"))
	{
		warning_message("The object " + object_get_name(newManager.object_index) + " does not call its parents Create event. \n"
						+ "To Fix: Place the code 'event_inherited()' at the beginning of its create event");
	}
}
room_goto_next();
instance_destroy();