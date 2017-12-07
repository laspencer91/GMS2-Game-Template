/// @description Update saved data for all registered Singleton objects
/// @function gss_SaveSingletons()

// Iterates through all the keys found in global.dataObjects, updating the
// variables registered for them.
if (ds_map_empty(global.dataObjects))
	return;

var _currentInstVarMap, _currentVariable, _currentSingletonName, _currentVarNameList;
var _singletonNameList = ds_map_get_keys(global.dataObjects);

// Iterate through each Singleton name in the global.dataObjects map
for (var _i = 0; _i < ds_list_size(_singletonNameList); _i++)
{
	_currentSingletonName = _singletonNameList[| _i] // Single String "name" of Singleton object
	
	// Grab the object_index using the name string found in our global.dataObjects map.
	var _currentSingletonObjIndex = asset_get_index(_currentSingletonName);
	
	// Move to next iteration if this singleton does not exist in our game (Ignore this one)
	if (!instance_exists(_currentSingletonObjIndex))
		continue;
	
	var _currentSingletonInstance = instance_find(_currentSingletonObjIndex, 0); // Grab the instanceid matching this object_index
	
	_currentInstVarMap	  = global.dataObjects[? _currentSingletonName];
	_currentVarNameList   = ds_map_get_keys(_currentInstVarMap);

	// Iterate through all variable names in this singletons variable map
	for (var _a = 0; _a < ds_list_size(_currentVarNameList); _a++)
	{
		_currentVariable = _currentVarNameList[| _a];
		_currentVarType  = gss_GetType(_currentVariable); // Retrieve a type constant by examining our "variableName" string
		
		// Strip out the "type identifier" in our string if the currentVariable is a dynamic resource (data struct, etc)
		if (_currentVarType != VAR_NORMAL)
			var _varNameNoIdentifier = string_delete(_currentVariable, 1, 1);
		
		switch (_currentVarType)
		{
			case real(DS_T_MAP):
				ds_map_replace_map(_currentInstVarMap, _currentVariable, variable_instance_get(_currentSingletonInstance, _varNameNoIdentifier));
				break;
			case real(DS_T_LIST):
				ds_map_replace_list(_currentInstVarMap, _currentVariable, variable_instance_get(_currentSingletonInstance, _varNameNoIdentifier));
				break;
			default:
				ds_map_replace(_currentInstVarMap, _currentVariable, variable_instance_get(_currentSingletonInstance, _currentVariable));
				break;
		}
	}
}