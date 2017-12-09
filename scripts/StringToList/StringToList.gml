/// @description Parses through a String and creates a list out of each section of characters before and after the 'char'.
/// @function StringToList(string, char)
/// @param string The string to parse.
/// @param char A single character (delimiter)
//
// Example: "1, 5, 10" will return a list of each number if char == ","
//
// http://www.seabassandgazellestudios.com/gml-scripts.html

var strToDivide  = string(argument0);
var delimiter    = argument1;
var list         = ds_list_create();
var current_char = ""; 
var finalString  = ""; 

// Object;323;232

for(var i = 1;  i <= string_length(strToDivide); i++)
{
	current_char = string_char_at(strToDivide, i);
	
	if (current_char == delimiter or i == string_length(strToDivide)) 
	{
		if (i == string_length(strToDivide))
			finalString += current_char;
			
		ds_list_add(list, finalString);
		finalString = "";
	}
	else
	{
		finalString += current_char;	
	}
}
return list;

ds_list_destroy(list);