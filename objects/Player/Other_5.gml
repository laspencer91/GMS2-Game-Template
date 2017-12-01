/// @description Update PlayerStats Object

// This will ensure that our stats are persisted between rooms by
// using the PlayerStats object. When the player is created in the
// next room it will start with these values!! No resetting happens :)

myHealth -= 10; // Just to show you how this data persists between rooms

PlayerStatsManager.myHealth	      = myHealth;
PlayerStatsManager.maxRunSpeed    = maxRunSpeed;
PlayerStatsManager.canFly         = canFly;
PlayerStatsManager.equippedWeapon = equippedWeapon;