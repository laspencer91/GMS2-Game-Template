/// @description Add a variable and let me decide what type of variable it is (LOCAL OR SINGLETON)
/// @function gss_AddVariable(variable)
/// @param variableName string

var _varToAdd_ = argument0;

if (id.persistent)
	gss_AddSingletonVar(_varToAdd_);
else
	gss_AddLocalVar(_varToAdd_);