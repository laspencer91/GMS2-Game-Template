/// @description Initialize

// With the way singletons are initialized, we dont even have
// to place this PlayerStatsMaager object in any rooms, and it will
// save our data between rooms when changing. We dont even have to check
// to see if it exists!! Because it always will :)

// If you want to save data between rooms you can either make the player persistant or use a PlayerStatsManager
// system as shown in the Example Project
maxRunSpeed    = 5;