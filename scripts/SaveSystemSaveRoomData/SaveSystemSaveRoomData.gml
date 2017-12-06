/// @desc Save the data of this room into our Save System

// Exit if the room has no data saved in it
if (!ds_map_exists(global.gameRooms, room_get_name(room)))
	return;

var _currentRoomMap = SaveSystemGetRoomMap(); // Get all instances in current room

if (ds_map_size(_currentRoomMap) <= 0)
{
	ds_map_destroy(_currentRoomMap);
	return;
}

var _keyParsedValues, _currentObjIndex, _objX, _objY, _currentVariableMap;
var _currentInstanceKey = ds_map_find_first(_currentRoomMap);

// Iterate through all instance keys in the room map
for (var i = 0; i < ds_map_size(_currentRoomMap); i++)
{
	// Parse Key
	_keyParsedValues = StringToList(_currentInstanceKey, INST_PROP_DELIMITER);
	
	show_message(_keyParsedValues[| 0]);
	
	_currentObjIndex = asset_get_index(_keyParsedValues[| 0]);
	_objX            = real(_keyParsedValues[| 1]);
	_objY            = real(_keyParsedValues[| 2]);
	
    _currentVariableMap = _currentRoomMap[? _currentInstanceKey];
	
	if (!instance_exists(_currentObjIndex))
	{
		ds_map_replace(_currentVariableMap, "destroyed", true);
	}
	else
	{
		// All this is going away
		var _instanceOfCurrentObj; 
	
		for (var _a = 0; _a < instance_number(_currentObjIndex); _a++)
		{
			_instanceOfCurrentObj = instance_find(_currentObjIndex, _a);
			
			if (_instanceOfCurrentObj.xstart == _objX && _instanceOfCurrentObj.ystart == _objY)
			{
				// This is where the actual variable update occurs
				SaveSystemUpdateInstVars(_currentVariableMap, _instanceOfCurrentObj);
				break;
			}
			else if (_a == instance_number(_currentObjIndex) - 1)
			{
				ds_map_replace(_currentVariableMap, "destroyed", true);
			}
		}
	}
	_currentInstanceKey = ds_map_find_next(_currentRoomMap, _currentInstanceKey);
}