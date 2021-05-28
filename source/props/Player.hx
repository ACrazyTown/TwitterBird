package props;

import nape.callbacks.CbType;
import nape.callbacks.CbEvent;
import nape.phys.BodyType;
import flixel.FlxG;
import flixel.addons.nape.FlxNapeSprite;
import nape.geom.Vec2;

class Player extends FlxNapeSprite
{
    public function new(x:Float, y:Float)
    {
        super(x, y);

        setPosition(x, y);

		loadGraphic("assets/images/twitterBird.png");
		createRectangularBody();

		setBodyMaterial(0, 0.5, 0.7, 1, 1);
    }
}