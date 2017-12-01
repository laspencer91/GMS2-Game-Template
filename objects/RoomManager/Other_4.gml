/// @description Make some property changes based on room
///
/// This is a perfect place to set any properties you need to set whe a room starts.
/// Maybe you need to use this object to spawn the player? Or set the players position?

// Here you can do specific things depending on what room you are in!
if (room = Level1)
{
	// DELETE ME. Just an example notifying you of this place in code.
	show_message("This is called from RoomManager on RoomStart Event as an example. \n"
	           + " You can set room properties here! This was called for the first level only");
}