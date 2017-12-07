/// @description Init

buttonSpriteWidth  = sprite_get_width(sLoadSlotButton);
buttonSpriteHeight = sprite_get_height(sLoadSlotButton);

buttonCentered = (window_get_width() / 2) - (buttonSpriteWidth / 2);

NUM_OF_SAVE_SLOTS = 3;

// Place buttons in the room
for (var i = 0; i < NUM_OF_SAVE_SLOTS; i++)
{
	var slotName = "saveGame" + string(i + 1) + ".txt";
	if (file_exists(slotName))
	{
		var inst = instance_create_layer(buttonCentered, 200 + ((buttonSpriteHeight + 10) * i), "Instances", ButtonLoadGame);
	
		inst.slotFileName = slotName;
		inst.myIndex      = i + 1;
	}
}