# GMS2 Game Template

----------


**A small project template that takes sets you up for good design structure. Includes basic Start Menu / Game Loading system. Has a simple Singleton system and basic managers setup for you.**

To add a new controller object that will be available throughout your game its as easy as.

1. Add and object
2. In the Create event put "event_inherited"
3. Set the Objects parent to "Singleton"

Walla!! You just made an object that will be in every room in your game, and unless you say otherwise... Its variables will not be reset on room change. Any object with this setup will automatically be created when NewGame is clicked (More accurately.. when the GameLoader room starts)

## Features

- **GameLoader Object** - Uses a loading screen to initialize your objects. Gets rid of the need of having to use "instance_exists" everywhere in your code. By the time your game gets to your gameplay room, all of your "Controller" objects will be available to use.

- **Easy Singleton Creation** - A singleton is an object that will persist through your entire game (Not be destroyed on room change), and there will only be one of. In order to create a new object like this you just set its parent to Singleton object and call "event_inherited" in its create event. Your object will be automatically created when you start a game, and you can never place another one, and it wont be destroyed unless you specify. These type of objects are good for things like PlayerStatManagers when you want to change rooms but dont want your player stats to be reset.

- **Framework For Single Responsibility Design** - Many times new developers don't jump on board with this principle. Creating more objects is many times seen as a bad thing. Using the system in place in the project it is easy to create objects that can handle specific responsibilities. Go along with it and watch how clean your code is. You player no longer has to worry about drawing gui elements, handling room transitions, and polling for new input states. Just take a look at the example project fo an example.

The project has a couple managers that you can choose to remove as you wish. You are not "Required" to use them. But I will describe the base purpose of each. Also, feel free to add any more that you would like. 

## Managers

- **GuiManager** - This is a simple object that can be in charge of showing the Gui Elements that need to be shown throughout your game. It is a singleton so there will only ever be one in your game and you don't need to place it in any of your rooms. Auto created in the Game Loader room (as is any singleton). 

 **RoomManager** - I use this object to handle room transitions, and keep track of different rooms. For example in an RPG maybe you keep a list of rooms that have been visited. This is the perfect place to do it. If you load data from a file you would store room pertinent information here. Also I like to set my starting room in a variable here. (For example: if you wanted to reset the game from player dying you could reference this variable to go back to)
 
  **InputManager** - I recommend everyone use this one. You set your keybindings and save them here. You create input states that can be updated in the begin step event. For example `jumpKeyPressed = keyboard_check(jumpKey)` then in your Player object you can say. `if (InputManager.jumpKeyPressed)`. Keeping input related code in the Input Manager keeps your other objects free of clutter and allows you some flexibility!

More docs coming..
