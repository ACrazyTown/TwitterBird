// custom preloader

// dont give a shit about it right now so it doesnt even function properly
// i have to research it a bit more because GOT dam!!!
package;

import flixel.FlxG;
import flixel.system.FlxBasePreloader;
import flash.text.TextField;
import flash.text.TextFormat;

class KTTBPreloader extends FlxBasePreloader
{
    var _text:TextField;

	public function new(MinDisplayTime:Float = 0, ?AllowedURLs:Array<String>)
	{
		super(MinDisplayTime, ?AllowedURLs);
	}

	override function create():Void
	{
		super.create();
	}

	override function update(Percent:Float):Void
	{
		super.update(Percent);
	}
}
