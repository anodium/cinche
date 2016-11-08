package cinche;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;

enum Result
{
	BLUE_WIN;
	ORANGE_WIN;
	DRAW;
}

class ResultsState extends FlxState
{
	public var results:Result;

	override public function create():Void
	{
		super.create();
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
	}

	override public function destroy():Void
	{
		super.destroy();
	}
}
