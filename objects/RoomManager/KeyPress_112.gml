/// @description Move To Next Room / Win Game

// Just debug stuff / testing
if (room != room_last)
	room_goto_next();
else
{
	show_message("Congrats you have won the game!!");
	game_end();
}