package props;

import nape.phys.BodyType;
import flixel.FlxG;
import flixel.addons.nape.FlxNapeSprite;

class Player extends FlxNapeSprite
{
    public function new(x:Float, y:Float)
    {
        super(x, y);
        
        makeGraphic(302, 323, 0x0);

        body.position.x = x;
        body.position.y = y;

        setPosition(x, y);

		createRectangularBody();
        loadGraphic("assets/images/twitterBird.png");

    }
}