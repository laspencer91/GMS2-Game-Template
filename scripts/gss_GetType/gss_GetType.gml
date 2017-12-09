/// @description This function returns the type of variable stored as a key in a map
///              using the DS_T identifier macros as set in ssMacros.

var _variableName_ = argument0;

var _identityChar_ = string_char_at(_variableName_, 1);

show_debug_message("Stripped Identity Character is " + string_letters(_identityChar_));

// This will basically strip away the letter if the first character of
// the variable name is a letter, and leave a digit if the first character
// was a number. As a result we can return the first character as a number
// if we know it is not a letter, and otherwise we will return -1 saying that
// the variable is a standard local variable.
if (string_length(string_digits(_identityChar_)) > 0)
{
	// Converts the DS_T_TYPE value from a string to a real number
	return real(_identityChar_); // This result should equal one of the DS_T_ types
}

return VAR_NORMAL;
