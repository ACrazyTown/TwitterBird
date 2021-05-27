/*
	package;

	import flixel.addons.nape.FlxNapeSprite;
	import nape.phys.BodyType;
	import nape.phys.Material;
	import flixel.FlxState;
	import flixel.FlxG;
	import flixel.FlxSprite;
	import flixel.addons.transition.FlxTransitionableState;
	import flixel.addons.nape.FlxNapeSpace;
	import flixel.util.FlxColor;

	// custom importin shit
	import props.Player;
	import props.Terrain;

	class PlayState extends FlxState
	{
	private var bg:FlxSprite;

	private var terrain:Terrain;
	private var player:FlxNapeSprite;

	override public function create():Void
	{
		super.create();
		FlxNapeSpace.init();

		bg = new FlxSprite(0, 0).makeGraphic(FlxG.width, FlxG.height, FlxColor.fromRGB(21, 104, 142, 255));
		add(bg);

		//terrain = new Terrain(32, 32);
		//terrain.physicsEnabled = false;

		//terrain.scale.set(11, 1.90);

		//terrain.body.type = BodyType.KINEMATIC;
		//terrain.solid = true;
		//terrain.body.type = BodyType.STATIC;

		//add(terrain);
		
		//char = new Player(481, 356.5);
		//char.setGraphicSize(Std.int(150));
		//char.body.type = BodyType.DYNAMIC;

		//char.updateHitbox();

		//add(char);

		player = new FlxNapeSprite(481, 356.5, true, true);
		player.loadGraphic("assets/images/twitterBird.png");

		add(player);
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		//FlxNapeSpace.space.gravity.setxy(0, 750);
	}
	}

 */

package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.addons.nape.FlxNapeSpace;
import flixel.addons.nape.FlxNapeSprite;
import flixel.util.FlxColor;

import props.Player;
import props.Terrain;

class PlayState extends FlxState
{
	var terrain:Terrain;
	var player:Player;
	
	override public function create():Void
	{
		super.create();
		FlxNapeSpace.init();
		/*
		var bg:FlxSprite = new FlxSprite(0, 0).makeGraphic(FlxG.width, FlxG.height, FlxColor.fromRGB(21, 104, 142, 255));
		add(bg);
		*/

		var bg:FlxSprite = new FlxSprite(0, 0).loadGraphic("assets/images/bg.png");
		bg.alpha = 0.7;
		add(bg);

		terrain = new Terrain(349, 659);

		//terrain.scale.set(11, 1.90);
		terrain.body.allowMovement = false;
		terrain.body.allowRotation = false;
		terrain.physicsEnabled = true;
		terrain.solid = true;

		terrain.updateHitbox();

		add(terrain);

		player = new Player(600, 485);

		player.setGraphicSize(Std.int(150));
		player.updateHitbox();

		player.physicsEnabled = true;
		player.solid = true;

		add(player);
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		//FlxNapeSpace.space.gravity.setxy(0, 750);
		FlxNapeSpace.space.gravity.setxy(0, 750);
		FlxNapeSpace.drawDebug = true;

		trace(terrain.body.position.x);
		trace(terrain.body.position.y);

		if (FlxG.keys.pressed.LEFT)
			terrain.body.position.x = terrain.body.position.x + 5;
		if (FlxG.keys.pressed.RIGHT)
			terrain.body.position.x++;
		if (FlxG.keys.pressed.UP)
			terrain.body.position.y--;
		if (FlxG.keys.pressed.DOWN)
			terrain.body.position.y++;
	}
}
