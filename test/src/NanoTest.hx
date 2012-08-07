package ;
import me.silvertoad.nano.haxe.core.group.NanoGroup;
import nme.display.Sprite;
import nme.Lib;
class NanoTest extends Sprite {
    public function new() {
        super();
        this.addChild(new NanoGroup());
    }

    public static function main() {
        Lib.current.addChild(new NanoTest());
    }
}
