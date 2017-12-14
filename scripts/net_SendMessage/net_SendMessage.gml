/// @description Creates a minified json string out of a provided ds_map and sends to a address.
/// @function net_SendMessage
/// @param {integer} messageMap - Map containing data to send
/// @param {string} ip - to send to
/// @param {string} port - to send to
/// @example net_SendMessage(net_CreateMessage(NetMessageType.connect), serverIp, serverPort);

var _message	= json_encode(argument0);
var _sendBuffer = util_CreateMiniJsonBuffer(_message);  // Create a minified json string inside of a buffer

network_send_udp_raw(global.myNetSocket, argument1, argument2, _sendBuffer, buffer_get_size(_sendBuffer));

buffer_delete(_sendBuffer);