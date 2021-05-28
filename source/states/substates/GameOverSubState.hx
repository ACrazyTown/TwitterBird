package states.substates;

import flixel.util.FlxTimer;
import flixel.text.FlxText;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxSubState;
import flixel.util.FlxColor;
import flixel.tweens.FlxTween;
import flixel.tweens.FlxEase;

class GameOverSubState extends FlxSubState
{
	public function new(x:Float, y:Float)
	{
		super();

		var overlay = new FlxSprite().makeGraphic(FlxG.width, FlxG.height, FlxColor.BLACK);
		overlay.alpha = 0;
		overlay.scrollFactor.set();
		add(overlay);

        var text = new FlxText(0, 0, 0, "yu win!!!1!1", 32);
        text.screenCenter();
        text.alpha = 0;
        text.scrollFactor.set();
        add(text);

		var moretext = new FlxText(0, 500, 0, "press enter to play agaien!!1!\n", 24);
		moretext.screenCenter(X);
		moretext.setFormat(null, 24, FlxColor.WHITE, FlxTextAlign.CENTER);
		moretext.alpha = 0;
		moretext.scrollFactor.set();
		add(moretext);

		var evenmoretext = new FlxText(0, 550, 0, "or quit the game and be a PUSSY", 24);
		evenmoretext.screenCenter(X);
		evenmoretext.setFormat(null, 24, FlxColor.WHITE, FlxTextAlign.CENTER);
		evenmoretext.alpha = 0;
		evenmoretext.scrollFactor.set();
		add(evenmoretext);

        FlxTween.tween(overlay, {alpha: 0.6}, 0.7, {ease: FlxEase.quartInOut});
		FlxTween.tween(text, {alpha: 1}, 1.25, {ease: FlxEase.quartInOut});

		new FlxTimer().start(1, function(tmr:FlxTimer)
		{
			FlxTween.tween(moretext, {alpha: 1}, 1.75, {ease: FlxEase.quartInOut});
		});

		new FlxTimer().start(2, function(tmr:FlxTimer)
		{
			FlxTween.tween(evenmoretext, {alpha: 1}, 1.75, {ease: FlxEase.quartInOut});
		});
	}

	override function update(elapsed:Float)
	{
		super.update(elapsed);

		if (FlxG.keys.justPressed.ENTER)
		{
			FlxG.resetState();
		}
	}
}
