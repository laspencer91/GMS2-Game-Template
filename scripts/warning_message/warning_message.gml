/// @desription Show a message to the user warning for debug purposes, prefixing the message
///            with the object that is calling this script
/// @param string MessageToDisplay

show_message(object_get_name(object_index) + ": " + argument0);