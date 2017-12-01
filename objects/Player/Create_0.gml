/// @description Initialize

// With the way singletons are initialized, we dont even have
// to place this PlayerStatsMaager object in any rooms, and it will
// save our data between rooms when changing. We dont even have to check
// to see if it exists!! Because it always will :)

// The data is currently saved on room change in the room end event.
// You could move this to the PlayerStatsManager, or room manager, but
// I feel as though doing it in this object gives more flexibility
myHealth	   = PlayerStatsManager.myHealth;
maxRunSpeed    = PlayerStatsManager.maxRunSpeed;
canFly         = PlayerStatsManager.canFly;
equippedWeapon = PlayerStatsManager.equippedWeapon;