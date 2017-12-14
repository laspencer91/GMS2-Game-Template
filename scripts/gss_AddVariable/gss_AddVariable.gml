/// @description Add a variable and let me decide what type of variable it is (LOCAL OR SINGLETON)
///				 Most of the time this script is prefered over "AddLocal" or "AddSingleton"
/// @function gss_AddVariable(variable)
/// @param {string} variableName Variable name to keep saved.
/// @param {Constant} dataType type of data if the data is a data structure. Currently
///                            only supporting ds_map, array, and ds_list
/// @example gss_AddVariable("x")
/// @example gss_AddVariable("y")

var _varToAdd_ = argument[0];
var _typeOfVar_;

if (argument_count > 1)
{
	_typeOfVar_ = argument[1];

	if (id.persistent)
		gss_AddSingletonVar(_varToAdd_, _typeOfVar_);
	else
		gss_AddLocalVar(_varToAdd_, _typeOfVar_);
}
else
{
	if (id.persistent)
		gss_AddSingletonVar(_varToAdd_);
	else
		gss_AddLocalVar(_varToAdd_);
}