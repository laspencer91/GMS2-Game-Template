/// @desc Add a message handling script to the networking message handler. The
///       given message type will link to a script that will be executed when
///       net_RecievePacket recieves a message who's MessageType is the same.
///		  These adds should be placed in the Network Objects create event after
///		  the net_Init() script is called.
/// @param {enum/string} MessageType Must be a unique identifier
/// @param {script} Script to execute when this message is incoming
/// @example net_AddMessageHandler(NetMessageType.connect, scr_net_handle_connect)

var _messageType	 = argument0;
var _scriptReference = argument1;

global.messageHandlers[? _messageType] = _scriptReference;