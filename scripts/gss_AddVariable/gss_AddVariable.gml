/// @description Add a variable and let me decide what type of variable it is (LOCAL OR SINGLETON)
/// @function gss_AddVariable(variable)
/// @param variableName string
/// @param OPTIONAL type of data type

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