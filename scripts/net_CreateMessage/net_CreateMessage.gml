/// @description Build a network message to be sent and return it
/// @function net_CreateMessage(messageType, key, value, ..., ...)
/// @param {enum} NetMessageType Type of Message
/// @param {String} [Key] to add
/// @param {Object} [Value] to associate with previous key
/// @param [...] Additional Key->Values
/// @returns {ds_map} Index of the generated map

/// @example net_CreateMessage(NetMessageType.connect, "userName", "Gloomy", "pass", "toad", "age", 12);

var _newPacket = ds_map_create();
_newPacket[? TYPE_OF_PACKET] = argument[0];				// Type of message is connect request

for (var _ii = 1; _ii + 1 < argument_count; _ii += 2)
{														// _ii odd is the key, _ii event is the value
	_newPacket[? argument[_ii]] = argument[_ii + 1];	// Add the specified value to the specified key
}

return _newPacket;