# GMS2 Game Template

----------


**A small project template that takes sets you up for good design structure. Includes basic Start Menu / Game Loading system. Has a simple Singleton system and basic managers setup for you.**

To add a new controller object that will be available throughout your game its as easy as.

1. Add and object
2. In the Create event put "event_inherited"
3. Set the Objects parent to "Singleton"

Walla!! You just made an object that will be in every room in your game, and unless you say otherwise... Its variables will not be reset on room change. Any object with this setup will automatically be created when NewGame is clicked (More accurately.. when the GameLoader room starts)

##Features

- **GameLoader Object** - Uses a loading screen to initialize your objects. Gets rid of the need of having to use "instance_exists" everywhere in your code. By the time your game gets to your gameplay room, all of your "Controller" objects will be available to use.


More docs coming. Gotta drive home. Take a look at the example project. See how easy it is to move across rooms and have data persisted.