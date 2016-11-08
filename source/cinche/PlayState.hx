package cinche;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.util.FlxColor;

class PlayState extends FlxState
{
	//Initialize objects
	private var field:FlxSprite = new FlxSprite(0, 0);

	private var ditB:FlxSprite = new FlxSprite();
	private static inline var DIT_B_X = 4;
	private static inline var DIT_B_Y = 32;

	private var ditO:FlxSprite = new FlxSprite();
	private static inline var DIT_O_X = 59;
	private static inline var DIT_O_Y = 32;

	override public function create():Void
	{
		super.create();

		field.makeGraphic(63, 63, FlxColor.BLACK);

		ditB.makeGraphic(1, 1, FlxColor.BLUE);
		ditB.x = DIT_B_X;
		ditB.y = DIT_B_Y;

		ditO.makeGraphic(1, 1, FlxColor.ORANGE);
		ditO.x = DIT_O_X;
		ditO.y = DIT_O_Y;

		add(field);
		add(ditB);
		add(ditO);
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);

		//Check collisions.
		if (FlxG.pixelPerfectOverlap(ditB, ditO))
		{
			//They both crashed into each other; it's a draw.
			#if debug
			FlxG.cameras.flash(FlxColor.WHITE);
			#end
		}

		if (FlxG.pixelPerfectOverlap(ditB, field))
		{
			//ditB crashed into a trail; ditO wins.
			#if debug
			FlxG.cameras.flash(FlxColor.BLUE);
			#end
		}

		if (FlxG.pixelPerfectOverlap(ditO, field))
		{
			//ditO crashed into a trail; ditB wins.
			#if debug
			FlxG.cameras.flash(FlxColor.ORANGE);
			#end
		}

		//Stamp dits onto field for trail.
		field.stamp(ditB, cast (ditB.x, Int), cast (ditB.y, Int));
		field.stamp(ditO, cast (ditO.x, Int), cast (ditO.y, Int));

		//ditB Input
		if (FlxG.keys.pressed.W)
		{
			ditB.y -= 1;
		}

		if (FlxG.keys.pressed.A)
		{
			ditB.x -= 1;
		}

		if (FlxG.keys.pressed.S)
		{
			ditB.y += 1;
		}

		if (FlxG.keys.pressed.D)
		{
			ditB.x += 1;
		}

		//ditO Input
		if (FlxG.keys.pressed.UP)
		{
			ditO.y -= 1;
		}

		if (FlxG.keys.pressed.LEFT)
		{
			ditO.x -= 1;
		}

		if (FlxG.keys.pressed.DOWN)
		{
			ditO.y += 1;
		}

		if (FlxG.keys.pressed.RIGHT)
		{
			ditO.x += 1;
		}
	}

	override public function destroy():Void
	{
		field.destroy();
		ditB.destroy();
		ditO.destroy();
	}
}
