/// @desc Save the data of this room into our Save System

var _currentRoomMap = SaveSystemGetRoomMap();

if (ds_map_size(_currentRoomMap) <= 0)
{
	ds_map_destroy(_currentRoomMap);
	return;
}

var _keyParsedValues, _currentObjIndex, _objX, _objY, _currentInstanceVariableMap;
var _currentKey      = ds_map_find_first(_currentRoomMap);

for (var i = 0; i < ds_map_size(_currentRoomMap); i++)
{
	// Parse Key
	_keyParsedValues = StringToList(_currentKey, INST_PROP_DELIMITER);
	_currentObjIndex = asset_get_index(_keyParsedValues[| 0]);
	_objX            = real(_keyParsedValues[| 1]);
	_objY            = real(_keyParsedValues[| 2]);
	
    _currentInstanceVariableMap = _currentRoomMap[? _currentKey];
	
	if (!instance_exists(_currentObjIndex))
	{
		ds_map_replace(_currentInstanceVariableMap, "destroyed", false);
	}
	else
	{
		var _instanceOfCurrentObj; 
		for (var _a = 0; _a < instance_number(_currentObjIndex); _a++)
		{
			_instanceOfCurrentObj = instance_find(_currentObjIndex, _a);
			
			if (_instanceOfCurrentObj.xstart == _objX && _instanceOfCurrentObj.ystart == _objY)
			{
				// This is where the actual variable update occurs
				SaveSystemUpdateInstVars(_currentInstanceVariableMap, _instanceOfCurrentObj);
			}
		}
	}
	ds_map_find_next(_currentRoomMap, _currentKey);
}