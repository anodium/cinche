package cinche;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.tweens.FlxTween;
import openfl.Assets;

class TitleState extends FlxState
{
	private var _logo:FlxSprite;
	private static inline var _LOGO_X = 15;
	private static inline var _LOGO_Y = 8;

	private var _tween:FlxTween;

	override public function create():Void
	{
		super.create();

		_logo = new FlxSprite(-64, _LOGO_Y, Assets.getBitmapData("assets/images/logo.png"));
		_logo.pixelPerfectRender = true;

		_tween = FlxTween.linearMotion(_logo, -64, _LOGO_Y, _LOGO_X, _LOGO_Y, 1.5, true);

		add(_logo);
		_tween.start();
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
	}

	override public function destroy():Void
	{
		_tween.destroy();
		_logo.destroy();

		super.destroy();
	}
}
