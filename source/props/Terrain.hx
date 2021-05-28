package props;

import nape.callbacks.CbType;
import nape.phys.BodyType;
import flixel.FlxG;
import flixel.addons.nape.FlxNapeSprite;
import nape.geom.Vec2;
import nape.phys.Body;

class Terrain extends FlxNapeSprite
{

	public function new(x:Float, y:Float):Void
	{
		super(x, y);

		//setPosition(x, y);

		/*
		body.position.x = x;
		body.position.y = y;
		*/

		updatePosition();

        loadGraphic("assets/images/terrainGrass.png");
		createRectangularBody();

		body.translateShapes(Vec2.get(0, -120));

		setBodyMaterial(1, 0.3, 0.2, 0.6, 1);
	}
}