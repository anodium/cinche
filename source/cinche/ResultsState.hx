package cinche;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;

enum Result
{
	DRAW;
	BLUE_WIN;
	ORANGE_WIN;
}

class ResultsState extends FlxState
{
	private var result:Result = Result.DRAW;

	function new(?result:Result):Void
	{
		super();

		this.result = result;
	}

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
