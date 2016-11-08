package cinche;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.effects.FlxFlicker;
import flixel.system.FlxSound;
import flixel.tweens.FlxTween;

class TitleState extends FlxState
{
	//Initialize objects
	private var logo:FlxSprite = new FlxSprite();
	private static inline var LOGO_X = 15;
	private static inline var LOGO_Y = 16;

	private var tween:FlxTween;

	private var prompt:FlxSprite = new FlxSprite();
	private static inline var PROMPT_X = 20;
	private static inline var PROMPT_Y = 51;

	private var start_sound:FlxSound;

	private var transition_started:Bool = false;

	override public function create():Void
	{
		super.create();

		//Load sound.
		#if flash
		start_sound = FlxG.sound.load("sounds/engine_start_white.mp3");
		#else
		start_sound = FlxG.sound.load("sounds/engine_start_white.ogg");
		#end
		//When the sound finishes playing, go to the menu.
		start_sound.onComplete = function()
								{
									FlxG.switchState(new MenuState());
								};

		//Load logo.
		logo.loadGraphic("images/logo.png");
		logo.x = -64;
		logo.y = LOGO_Y;

		//Load platform-dependent call for action.
		#if desktop
		prompt.loadGraphic("images/start.png");
		#elseif mobile
		prompt.loadGraphic("images/touch.png");
		#elseif web
		if (FlxG.onMobile)
		{
			prompt.loadGraphic("images/touch.png");
		} else {
			prompt.loadGraphic("images/start.png");
		}
		#end

		prompt.x = PROMPT_X;
		prompt.y = PROMPT_Y;

		//Have logo slide in from the left, then flicker prompt.
		tween = FlxTween.tween(logo, { x: LOGO_X, y: LOGO_Y }, 1.5,
								{ type: FlxTween.ONESHOT, onComplete: 
								function(tween:FlxTween)
								{
									FlxFlicker.flicker(prompt, 0.35, 0.5, true);
									add(prompt);
								}});

		add(logo);
		tween.start();
	}

	override public function update(elapsed:Float):Void
	{
		//Check if any input is given by the user.
		#if desktop
		if (FlxG.keys.firstJustPressed() != -1 && !FlxG.onMobile)
		#elseif mobile
		if (FlxG.touches.getFirst() != null && FlxG.onMobile)
		#elseif web
		if (
			(FlxG.keys.firstJustPressed() != -1 && !FlxG.onMobile) ||
			(FlxG.touches.getFirst() != null && FlxG.onMobile)
		)
		#end
		{
			//Make sure the transition can only start *once*.
			if (!transition_started)
			{
				transition_started = true;

				//Do transition cleanup in case it's interrupted by the user.
				tween.cancel();
				logo.x = LOGO_X;
				prompt.x = PROMPT_X;
				prompt.y = PROMPT_Y;
				add(prompt);

				FlxFlicker.flicker(prompt, 0.05, 0.15, true);
				start_sound.play();
			}
		}

		super.update(elapsed);
	}

	override public function destroy():Void
	{
		start_sound.destroy();
		prompt.destroy();
		tween.destroy();
		logo.destroy();

		super.destroy();
	}
}
