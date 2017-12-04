/// @description Returns the value wrapped, values over or under will be wrapped around
/// @function Wrap(value, min, max)
/// @param value
/// @param min
/// @param max

if (argument0 mod 1 == 0)
{
	while (argument0 > argument2 || argument0 < argument1)
	{
		if (argument0 > argument2)
			argument0 += argument1 - argument2 - 1;
		else if (argument0 < argument1)
			argument0 += argument2 - argument1 + 1;
	}
	return(argument0);
}
else
{
	var vOld = argument0 + 1;
	while (argument0 != vOld)
	{
		vOld = argument0;
		if (argument0 < argument1)
			argument0 = argument2 - (argument1 - argument0);
		else if (argument0 > argument2)
			argument0 = argument1 + (argument0 - argument2);
	}
	return(argument0);
}