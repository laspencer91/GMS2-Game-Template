///@desription Show a message to the user warning for debug purposes, prefixing the message
///            with the object that is calling this script
///@param argument0 is the message to display

show_message(object_get_name(object_index) + ": " + argument0);