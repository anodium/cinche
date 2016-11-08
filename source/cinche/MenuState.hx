package cinche;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;

class MenuState extends FlxState
{
	override public function create():Void
	{
		super.create();
	}

	override public function update(elapsed:Float):Void
	{
		FlxG.switchState(new PlayState());

		super.update(elapsed);
	}

	override public function destroy():Void
	{
		super.destroy();
	}
}
