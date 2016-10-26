package cinche;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.tweens.FlxTween;

class TitleState extends FlxState
{
	private var logo:FlxSprite = new FlxSprite();
	private static inline var LOGO_X = 15;
	private static inline var LOGO_Y = 8;

	private var tween:FlxTween;

	override public function create():Void
	{
		super.create();

		logo.loadGraphic("assets/images/logo.png");
		logo.x = -64;
		logo.y = LOGO_Y;

		tween = FlxTween.tween(logo, { x: LOGO_X, y: LOGO_Y}, 1.5, { type: FlxTween.ONESHOT });

		add(logo);
		tween.start();
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
	}

	override public function destroy():Void
	{
		tween.destroy();
		logo.destroy();

		super.destroy();
	}
}
