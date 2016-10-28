package cinche;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.effects.FlxFlicker;
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

	override public function create():Void
	{
		super.create();

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
		                      { type: FlxTween.ONESHOT, onComplete: show_prompt });

		add(logo);
		tween.start();
	}

	private function show_prompt(tween:FlxTween):Void
	{
		FlxFlicker.flicker(prompt, 0.35, 0.5, true);
		add(prompt);
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
			FlxFlicker.flicker(prompt, 0.15, 0.25, true);
		}

		super.update(elapsed);
	}

	override public function destroy():Void
	{
		prompt.destroy();
		tween.destroy();
		logo.destroy();

		super.destroy();
	}
}
