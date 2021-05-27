// preloader ACTUALLY works
// very broken but yuh

package;

import flixel.system.FlxBasePreloader;
import flixel.system.FlxAssets;

import openfl.display.Sprite;
import flash.display.Bitmap;
import flash.display.BitmapData;
import flash.display.BlendMode;
import flash.display.Sprite;
import flash.text.TextField;
import flash.text.TextFormat;
import flash.Lib;
import flixel.FlxG;

@:bitmap("assets/preloadArt.png") class LogoImage extends BitmapData {}

class KTTBPreloader extends FlxBasePreloader
{
    var _text:TextField;

	public function new(MinDisplayTime:Float = 0, ?AllowedURLs:Array<String>)
	{
		super(MinDisplayTime, AllowedURLs);
	}

	var art:Sprite;
	var text:TextField;

	override function create():Void
	{
		this._width = Lib.current.stage.stageWidth;
		this._height = Lib.current.stage.stageHeight;

		// what the fuck am i supposed to divide this.width with ???
		var ratio:Float = this._width / 1280;

		art = new Sprite();
		art.addChild(new Bitmap(new LogoImage(0,0)));
		art.x = (this._width / 2) - (art.width / 2);
		art.y = (this._height / 2) - (art.height / 2);
		addChild(art);

        text = new TextField();
        text.defaultTextFormat = new TextFormat(FlxAssets.FONT_DEFAULT, Std.int(24 * ratio), 0xffffff, false, false, false, "", "");
        text.embedFonts = true;
        text.selectable = false;
        text.multiline = false;
        text.x = 0;
        text.y = 5.2 * this._height / 6;
        text.width = _width;
        text.height = Std.int(32 * ratio);
        text.text = "Loading";
        addChild(text);

		super.create();
	}

	override function update(Percent:Float):Void
	{
		text.text = "Loading " + Std.int(Percent * 100) + "%";
		super.update(Percent);
	}
}
