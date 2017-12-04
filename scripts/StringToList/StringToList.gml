/// @description Parses through a String and creates a list out of each section of characters before and after the 'char'.
/// @function StringToList(string, char)
/// @param string The string to parse.
/// @param char A single character (delimiter)
//
// Example: "1, 5, 10" will return a list of each number if char == ","
//
// http://www.seabassandgazellestudios.com/gml-scripts.html

var str_temp = string(argument0);
var list = ds_list_create();
var str1 = ""; 
var str2 = ""; 
var i = 1;

for(i = 1;  i <= string_length(str_temp); i++)
{
	str1 = string_char_at(str_temp,i);
	str2 = str2 + str1;
	if (str1 == argument1 or i == string_length(str_temp)) 
	{
		ds_list_add(list, str2);
		str2 = "";
	}
}
return list;

ds_list_destroy(list);