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

		setBodyMaterial(1, 0.3, 0.2, 0.6, 1);
    }
}