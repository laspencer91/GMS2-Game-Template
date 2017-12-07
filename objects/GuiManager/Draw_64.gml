/// @description
/// Gui drawing can go here!

if (instance_exists(Player))
{
	draw_text(10, 10, "Health: " + string(Player.myHealth));
}

draw_text(10, 80, "Press F1 to change level");