/// @function MergeColors(col1,col2,...,amount)
///
/// @description Returns a color merged from a series of two or more colors
///				  controlled by the given amount. A value of 0 returns the
///				  first color, a value of 1 returns the last color, and values
///			 	  in between return a blend of two adjacent colors in the series.
///
/// @param col1 First Color
/// @param col2 Additional Colors..
/// @param amount Blend Amount
//
// GMLscripts.com/license
{
    var colors = argument_count-1;
    var amount = clamp(argument[colors], 0, 1);
    var n = amount * (colors-1);
    var col1 = floor(n);
    var col2 = col1 + 1;
    return merge_color(argument[col1], argument[col2], frac(n));
}