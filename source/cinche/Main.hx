package cinche;

import flixel.FlxGame;
import openfl.display.Sprite;

class Main extends Sprite
{
	public function new()
	{
		super();
		//Since the game was designed for the low-rez jam 2016, max internal resolution is 64x64.
		addChild(new FlxGame(64, 64, TitleState, 1, 60, 60, true));
	}
}
