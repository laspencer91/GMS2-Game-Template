/// @description Wait for Save Input

if (keyboard_check_pressed(ord("1")))
{
	show_message("Saved Game To Slot 1");
	SaveSystemSaveSecure("saveGame1.txt");
}
else if (keyboard_check_pressed(ord("2")))
{
	show_message("Saved Game To Slot 2");
	SaveSystemSaveSecure("saveGame2.txt");	
}
else if (keyboard_check_pressed(ord("3")))
{
	show_message("Saved Game To Slot 3");
	SaveSystemSaveSecure("saveGame3.txt");	
}