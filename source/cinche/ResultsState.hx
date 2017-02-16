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
		game_blurb.y = -64;

		//Load the winner graphic.
		if (Result.BLUE_WIN)
		{
			winner_blurb.loadGraphic("images/orange_win.png");
		} else if (Result.ORANGE_WIN)
		{
			winner_blurb.loadGraphic("images/blue_win.png");
		} else {
			winner_blurb.loadGraphic("images/draw.png");
		}
		winner_blurb.x = WINNER_X;
		winner_blurb.y = 64;

		add(game_blurb);
		add(winner_blurb);
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
