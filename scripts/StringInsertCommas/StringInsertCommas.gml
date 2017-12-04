/// @description Inserts "," into places it belongs.
/// @function StringInsertCommas(real)
///	@param real A number or String (Number Value)
//
// Examples:
//   Before: 1000000
//   After: 1,000,000


if ( is_real(argument0) )
{
    var _str = string(argument0);
}
else
{
    var _str = argument0;
}

var str_ = "";

var str_length = string_length(_str);

var space_count = 0;

for ( var i = str_length; i > 0; i --; )
{
    str_ = string_char_at(_str,i) + str_;
    space_count ++;
    if ( space_count == 3 )
    {
        space_count = 0;
        if ( i > 1 )
        {
            str_ = "," + str_;
        }
    }
}

return str_;