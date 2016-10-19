package cinche;

import flixel.FlxGame;
import openfl.display.Sprite;

class Main extends Sprite
{
	public function new()
	{
		super();
		addChild(new FlxGame(64, 64, TitleState, 1, 60, 60, true));
	}
}
