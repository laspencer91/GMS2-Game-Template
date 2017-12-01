/// @description Init To Be Inherited
/// THIS OBJECT IS JUST A PARENT. IT IS NOT CREATED ANYWHERE, ONLY CHILDREN OF IT ARE


// A Singleton is an object that is persistent through your game, and is accessable
// at all times from anywhere. In addition it ensures it never has a duplicate of itself.
// 
// For example if you do not want to reset your players
// health when moving to a new room, you could store the players current health in a
// singleton on room end event, and when the player gets created you could load the health
// from that object. Since a Singleton (Persistent) object never gets destroyed unless told
// to do so with instance_destroy(), that players value will not be changed on room transitioning.


correctlyInitialized = true; // Called when you say event_inherited(); in your child object (PlayerStats for example);
persistent = true;

// If there is already one of me, destroy myself. (Singleton)
if (instance_number(object_index) > 1)
	instance_destroy();