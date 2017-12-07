/// @description Load Game

instance_create_layer(0, 0, "Instances", GameLoader);
gss_Debug();
with (ButtonLoadGame)
{
	instance_destroy();	
}