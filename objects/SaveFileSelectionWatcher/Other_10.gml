/// @description Load Game

instance_create_layer(0, 0, "Instances", GameLoader);
SaveSystemDebug();
with (ButtonLoadGame)
{
	instance_destroy();	
}