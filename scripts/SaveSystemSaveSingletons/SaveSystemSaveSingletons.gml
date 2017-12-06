/// @description Update saved data for all registered Singleton objects
/// @function SaveSystemSaveSingletons()

// Iterates through all the keys found in global.dataObjects, updating the
// variables registered for them.
if (ds_map_empty(global.dataObjects))
	return;

var _currentSingletonName = ds_map_find_first(global.dataObjects);
var _currentInstVarMap, _currentVariable;

while (!is_undefined(_currentSingletonName))
{
	var _currentSingletonObjIndex = asset_get_index(_currentSingletonName);
	
	if (!instance_exists(_currentSingletonObjIndex))
		continue;
	
	var _currentSingletonInstance = instance_find(_currentSingletonObjIndex, 0);
	
	_currentInstVarMap	  = global.dataObjects[? _currentSingletonName];
	_currentVariable      = ds_map_find_first(_currentInstVarMap);
	
	while (!is_undefined(_currentVariable))
	{
		ds_map_replace(_currentInstVarMap, _currentVariable, variable_instance_get(_currentSingletonInstance, _currentVariable));
		_currentVariable = ds_map_find_next(_currentInstVarMap, _currentVariable);
	}

	_currentSingletonName = ds_map_find_next(global.dataObjects, _currentSingletonName);
}