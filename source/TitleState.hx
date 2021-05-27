package;

import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.text.FlxText;
import flixel.addons.plugin.taskManager.FlxTask;
import flixel.FlxG;
import flixel.addons.transition.FlxTransitionSprite.GraphicTransTileDiamond;
import flixel.addons.transition.FlxTransitionableState;
import flixel.addons.transition.TransitionData;
import flixel.graphics.FlxGraphic;
import flixel.math.FlxPoint;
import flixel.math.FlxRect;
import flixel.util.FlxColor;

class TitleState extends FlxTransitionableState
{
	static var init:Bool = false;

	var transitioning:Bool = false;
	var menuOptions:Array<String> = ["play", "options", "quit"];

    var curSelected:Int = 0;
    var txtGroup:FlxTypedGroup<FlxText>;

	override function create()
	{
		super.create();

		#if FLX_MOUSE
		FlxG.mouse.visible = false;
		#end

		if (!init)
		{
			var diamond:FlxGraphic = FlxGraphic.fromClass(GraphicTransTileDiamond);
			diamond.persist = true;
			diamond.destroyOnNoUse = false;

			FlxTransitionableState.defaultTransIn = new TransitionData(FADE, FlxColor.BLACK, 1, new FlxPoint(0, -1), {asset: diamond, width: 32, height: 32},
				new FlxRect(-200, -200, FlxG.width * 1.4, FlxG.height * 1.4));
			FlxTransitionableState.defaultTransOut = new TransitionData(FADE, FlxColor.BLACK, 0.7, new FlxPoint(0, 1),
				{asset: diamond, width: 32, height: 32}, new FlxRect(-200, -200, FlxG.width * 1.4, FlxG.height * 1.4));

			init = true;

			FlxTransitionableState.defaultTransIn.tileData = {asset: diamond, width: 32, height: 32};
			FlxTransitionableState.defaultTransOut.tileData = {asset: diamond, width: 32, height: 32};

			transIn = FlxTransitionableState.defaultTransIn;
			transOut = FlxTransitionableState.defaultTransOut;
		}

        txtGroup = new FlxTypedGroup<FlxText>();
        add(txtGroup);

        var mnTxt:FlxText = new FlxText(0, 25, 0,
            "kill the twitter bird\n"
            + "flixel",
            54);
        mnTxt.setFormat(null, 54, FlxColor.WHITE, FlxTextAlign.CENTER);
        mnTxt.screenCenter(X);

        add(mnTxt);

        for (i in 0...menuOptions.length)
        {
            var texty:FlxText = new FlxText(0, 375 + (i * 50), 0, menuOptions[i], 42);
            texty.setFormat(null, 42, FlxColor.WHITE);
            texty.ID = i;
			texty.x = (FlxG.width / 2) - (texty.width / 2);
            txtGroup.add(texty);
        }
	}

	override function update(elapsed:Float):Void
	{
		super.update(elapsed);

		if (FlxG.keys.justPressed.UP)
		{
			changeSelection(-1);
		}

        if (FlxG.keys.justPressed.DOWN)
        {
            changeSelection(1);
        }

        if (FlxG.keys.justPressed.ENTER)
        {
            switch (menuOptions[curSelected])
            {
                case "play":
                    FlxG.switchState(new PlayState());
            }
        }

		txtGroup.forEach(function(txt:FlxText)
		{
			txt.color = FlxColor.WHITE;

			if (txt.ID == curSelected)
				txt.color = FlxColor.YELLOW;
		});

	}

    function changeSelection(change:Int = 0)
    {
        curSelected += change;

        if (curSelected < 0)
            curSelected = txtGroup.length - 1;
        if (curSelected >= txtGroup.length)
            curSelected = 0;

		trace(curSelected);
		trace(change);

    }
}
