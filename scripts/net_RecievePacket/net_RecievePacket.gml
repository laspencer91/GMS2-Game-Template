/// @description This packet belongs in the [Network - Async] Event of the
///              instance that called net_Init();
/// This script recieves the message and decodes it into the map that you
/// can easily retrieve values from using the keys that you set using net_CreateMessage();

_recievedJson		    = buffer_read(async_load[? "buffer"], buffer_string);		// Get the text from the recieved buffer
recievedMessage		    = json_decode(_recievedJson);								// Convert the json_string to a ds_map
_recievedMessageType    = recievedMessage[? TYPE_OF_PACKET];						// Get the message type out of the map
_handlerScript          = global.messageHandlers[? _recievedMessageType];

// Execute the network handler script associated with the message type of this packet

if (script_exists(_handlerScript))
	script_execute(global.messageHandlers[? _recievedMessageType]);
else
	show_error("There is no script assigned to handle the network message type recieved.", false);
