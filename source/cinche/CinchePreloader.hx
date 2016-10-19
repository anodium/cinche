package cinche;

import flixel.system.FlxBasePreloader;

class CinchePreloader extends FlxBasePreloader
{
	override public function new(MinDisplayTime:Float = 0, ?AllowedURLs:Array<String>):Void
	{
		super(MinDisplayTime, AllowedURLs);
	}

	override private function create():Void
	{
		super.create();
	}

	override private function destroy():Void
	{
		super.destroy();
	}

	override public function update(Percent:Float):Void
	{
		
	}
}