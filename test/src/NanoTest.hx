package ;
import me.silvertoad.nano.haxe.core.group.layout.NanoVerticalLayout;
import nme.display.Sprite;
import nme.Lib;
class NanoTest extends Sprite {
    public function new() {
        super();
        new NanoVerticalLayout();
//        this.addChild(new NanoGroup());
    }

    public static function main() {
        Lib.current.addChild(new NanoTest());
    }
}
