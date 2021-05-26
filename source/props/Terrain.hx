package props;

import nape.phys.BodyType;
import flixel.FlxG;
import flixel.addons.nape.FlxNapeSprite;

class Terrain extends FlxNapeSprite
{
	public function new(x:Float, y:Float):Void
	{
		super(x, y);

        makeGraphic(64, 64, 0x0);

		body.position.x = x;
		body.position.y = y;

		setPosition(x, y);

		createRectangularBody();

        loadGraphic("assets/images/terrainGrass.png");
	}
}