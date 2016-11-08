package cinche;

import flixel.system.FlxBasePreloader;

//Stub the default FlxPreloader, since it breaks the low-rez aesthetic.
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