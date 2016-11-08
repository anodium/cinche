package cinche;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.util.FlxColor;

//Abstract away any internal representation for an enumeration.
private enum Direction {
	UP;
	DOWN;
	LEFT;
	RIGHT;
}

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

	private static inline var SPEED = 1;
	private var ditB_direction:Direction = Direction.RIGHT;
	private var ditO_direction:Direction = Direction.LEFT;

	override public function create():Void
	{
		super.create();

		field.makeGraphic(63, 63, FlxColor.TRANSPARENT);

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
			FlxG.camera.flash(FlxColor.WHITE);
			#end
		}

		if (FlxG.pixelPerfectOverlap(ditB, field))
		{
			//ditB crashed into a trail; ditO wins.
			#if debug
			FlxG.camera.flash(FlxColor.BLUE);
			#end
		}

		if (FlxG.pixelPerfectOverlap(ditO, field))
		{
			//ditO crashed into a trail; ditB wins.
			#if debug
			FlxG.camera.flash(FlxColor.ORANGE);
			#end
		}

		//Stamp dits onto field for trail.
		field.stamp(ditB, cast (ditB.x, Int), cast (ditB.y, Int));
		field.stamp(ditO, cast (ditO.x, Int), cast (ditO.y, Int));

		//ditB Input
		if (FlxG.keys.pressed.W)
		{
			ditB_direction = Direction.UP;
		}

		if (FlxG.keys.pressed.A)
		{
			ditB_direction = Direction.LEFT;
		}

		if (FlxG.keys.pressed.S)
		{
			ditB_direction = Direction.DOWN;
		}

		if (FlxG.keys.pressed.D)
		{
			ditB_direction = Direction.RIGHT;
		}

		//ditO Input
		if (FlxG.keys.pressed.UP)
		{
			ditO_direction = Direction.UP;
		}

		if (FlxG.keys.pressed.LEFT)
		{
			ditO_direction = Direction.LEFT;
		}

		if (FlxG.keys.pressed.DOWN)
		{
			ditO_direction = Direction.DOWN;
		}

		if (FlxG.keys.pressed.RIGHT)
		{
			ditO_direction = Direction.RIGHT;
		}

		//ditB Movement
		if (ditB_direction == Direction.UP)
		{
			ditB.y -= SPEED;
		}

		if (ditB_direction == Direction.LEFT)
		{
			ditB.x -= SPEED;
		}

		if (ditB_direction == Direction.DOWN)
		{
			ditB.y += SPEED;
		}

		if (ditB_direction == Direction.RIGHT)
		{
			ditB.x += SPEED;
		}

		//ditO Movement
		if (ditO_direction == Direction.UP)
		{
			ditO.y -= SPEED;
		}

		if (ditO_direction == Direction.LEFT)
		{
			ditO.x -= SPEED;
		}

		if (ditO_direction == Direction.DOWN)
		{
			ditO.y += SPEED;
		}

		if (ditO_direction == Direction.RIGHT)
		{
			ditO.x += SPEED;
		}
	}

	override public function destroy():Void
	{
		field.destroy();
		ditB.destroy();
		ditO.destroy();
	}
}
