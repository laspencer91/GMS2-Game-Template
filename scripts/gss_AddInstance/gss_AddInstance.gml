/// @desc Adds an instance of an object in a specific room to the Save Data Structure
/// @param newSaveInstance  Id of Instance to save
/// @param typeOfInstance (LOCAL, SINGLETON)
var _newSaveInstance = argument[0];
var _typeOfInstance;

// Auto Detect Type Of Instance
if (argument_count > 1)
	_typeOfInstance  = argument[1];
else
	if (_newSaveInstance.persistent == false)
		_typeOfInstance = LOCAL;
	else
		_typeOfInstance = SINGLETON;
		
// Build the key for this instance using its x and y position delimited by the constant
// set in the gss_Init script. EX: Player;10;50

var _instanceName = object_get_name(_newSaveInstance.object_index);
var _instanceKey  = gss_GenerateInstanceKey(_newSaveInstance);

// This inserts a new Map for this instances variables into the correct room map with a generated key 
// for this instance. This new map that we create here is used to add this instances variables to 
// when called by the gss_AddVar() script. 
// NOTE: That this will fail if this instance has already been added in this room.

if (_typeOfInstance == LOCAL)
{
	var _roomMapILiveIn = gss_GetRoomMap();
	
	// Does this instance already exist in the rooms? (In the data structures context)
	if (!ds_map_exists(_roomMapILiveIn, _instanceKey))
	{
		// Create New Instance In Map And Save
		var _newInstVarMap = ds_map_create();
	
		ds_map_add(_newInstVarMap, "destroyed", false);
		ds_map_add_map(_roomMapILiveIn, _instanceKey, _newInstVarMap);
	}
	else
	{
		// I already exist in the map so load my variables into me
		var _myVarMap  = _roomMapILiveIn[? _instanceKey];
		var _myVarKeys = ds_map_get_keys(_myVarMap);
		
		for (var _i = 0; _i < ds_list_size(_myVarKeys); _i++)
		{
			var currentVarKey = _myVarKeys[| _i];
			var currentVarVal = _myVarMap[? currentVarKey];
			
			if (currentVarKey != "destroyed")
				variable_instance_set(_newSaveInstance, currentVarKey, currentVarVal);
			else
				if (currentVarVal == true) instance_deactivate_object(_newSaveInstance); // Disable instance if it was destroyed
		}
	}
}
else if (_typeOfInstance == SINGLETON)
{
	// Adds the instance as a Singleton. This is saying it is not room dependent. Usually
	// you can use this if you have created a singleton that is available from your game
	// loader room.
	
	if (!ds_map_exists(global.dataObjects, _instanceName))
		ds_map_add_map(global.dataObjects, _instanceName, ds_map_create());
	else
	{
		var _myVarMap  = global.dataObjects[? _instanceName];
		var _myVarKeys = ds_map_get_keys(_myVarMap);
		
		for (var _i = 0; _i < ds_list_size(_myVarKeys); _i++)
		{
			var currentVarKey = _myVarKeys[| _i];
			var currentVarVal = _myVarMap[? currentVarKey];
			
			variable_instance_set(_newSaveInstance, currentVarKey, currentVarVal);
		}
	}
}