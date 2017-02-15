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
	//Get the outcome of the match from the constructor.
	//Default to Result.DRAW if there is none.
	private var result:Result = Result.DRAW;

	//Initialize objects
	private var game_blurb:FlxSprite = new FlxSprite();
	private static inline var GAME_X = 22;
	private static inline var GAME_Y = 27;

	private var winner_blurb:FlxSprite = new FlxSprite();
	private static inline var WINNER_X = 18;
	private static inline var WINNER_Y = 32;

	function new(?result:Result):Void
	{
		super();

		this.result = result;
	}

	override public function create():Void
	{
		super.create();

		//Load "Game!" blurb.
		game_blurb.loadGraphic("images/game.png");
		game_blurb.x = GAME_X;
		game_blurb.y = GAME_Y;

		add(game_blurb);
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
