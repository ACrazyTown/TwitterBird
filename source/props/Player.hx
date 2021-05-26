package props;

import nape.phys.BodyType;
import flixel.FlxG;
import flixel.addons.nape.FlxNapeSprite;

class Player extends FlxNapeSprite
{
    public function new(x:Float, y:Float)
    {
        super(x, y);

        setPosition(x, y);

		loadGraphic("assets/images/twitterBird.png");
		createRectangularBody();
    }
}