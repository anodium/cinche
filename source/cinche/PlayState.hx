package cinche;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.util.FlxColor;
import flixel.math.FlxMath;

class PlayState extends FlxState
{
	private var ditB:FlxSprite = new FlxSprite();
	private static inline var DIT_B_X = 4;
	private static inline var DIT_B_Y = 32;

	private var ditO:FlxSprite = new FlxSprite();
	private static inline var DIT_O_X = 60;
	private static inline var DIT_O_Y = 32;

	override public function create():Void
	{
		super.create();

		ditB.makeGraphic(1, 1, FlxColor.BLUE);
		ditB.x = DIT_B_X;
		ditB.y = DIT_B_Y;

		ditO.makeGraphic(1, 1, FlxColor.ORANGE);
		ditO.x = DIT_O_X;
		ditO.y = DIT_O_Y;

		add(ditB);
		add(ditO);
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
	}
}
