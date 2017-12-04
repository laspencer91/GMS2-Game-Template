/// @function RoundFixed(number, places)
///
///  @description Returns the given number rounded to the a number of places.
///
///   @param   number      to round
///   @param   places      decimal places to round to
///
/// GMLscripts.com/license
{
    return round(argument0*power(10,argument1))/power(10,argument1);
}