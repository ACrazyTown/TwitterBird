package props;

import nape.phys.BodyType;
import flixel.FlxG;
import flixel.addons.nape.FlxNapeSprite;

class Terrain extends FlxNapeSprite
{
	public function new(x:Float, y:Float):Void
	{
		super(x, y);

		setPosition(x, y);

        loadGraphic("assets/images/terrainGrass.png");
		createRectangularBody();
	}
}