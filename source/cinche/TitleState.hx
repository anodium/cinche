package cinche;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import openfl.Assets;

class TitleState extends FlxState
{
	private var _logo:FlxSprite;

	override public function create():Void
	{
		super.create();

		_logo = new FlxSprite(15, 8, Assets.getBitmapData("assets/images/logo.png"));
		add(_logo);
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
	}

	override public function destroy():Void
	{
		_logo = null;

		super.destroy();
	}
}
