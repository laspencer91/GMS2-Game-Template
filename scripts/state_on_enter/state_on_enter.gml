/// @desc Returns true if the current state is running its first iteration (the state has just been changed)
/// @returns True if this is the first step that this state has been run on.
///
/// @example if (state_on_enter())
///				sprite_index = sPlayerLanding;

return stateMachines[| _machineToRunIndex_ + ON_ENTER_OFFSET];
