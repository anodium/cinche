package cinche;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.effects.FlxFlicker;
import flixel.system.FlxSound;
import flixel.tweens.FlxTween;

class TitleState extends FlxState
{
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

		start_sound = FlxG.sound.load("assets/sounds/engine_start_white.wav");
		start_sound.onComplete = function ()
		                         {
			                         FlxG.switchState(new MenuState());
		                         };

		logo.loadGraphic("assets/images/logo.png");
		logo.x = -64;
		logo.y = LOGO_Y;

		#if desktop
		prompt.loadGraphic("assets/images/start.png");
		#elseif mobile
		prompt.loadGraphic("assets/images/touch.png");
		#elseif web
		if (FlxG.onMobile)
		{
			prompt.loadGraphic("assets/images/touch.png");
		} else {
			prompt.loadGraphic("assets/images/start.png");
		}
		#end

		prompt.x = PROMPT_X;
		prompt.y = PROMPT_Y;

		tween = FlxTween.tween(logo, { x: LOGO_X, y: LOGO_Y }, 1.5,
		                      { type: FlxTween.ONESHOT, onComplete: 
		                      function (tween:FlxTween)
		                      {
			                      FlxFlicker.flicker(prompt, 0.35, 0.5, true);
			                      add(prompt);
		                      }});

		add(logo);
		tween.start();
	}

	override public function update(elapsed:Float):Void
	{
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
			if (!transition_started)
			{
				transition_started = true;
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
