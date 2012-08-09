package ;
import nme.events.MouseEvent;
import flash.display.DisplayObject;
import nme.Assets;
import nme.display.Bitmap;
import me.silvertoad.nano.haxe.core.group.NanoGroup;
import me.silvertoad.nano.haxe.core.group.layout.NanoBaseLayout;
import me.silvertoad.nano.haxe.core.group.layout.NanoVerticalLayout;
import nme.display.Sprite;
import nme.Lib;

class NanoTest extends Sprite {

    private var icon:Bitmap;

    public function new() {
        // http://devnet.jetbrains.net/message/5462981#5462981
        super();
        icon = new Bitmap(Assets.getBitmapData("assets/1.png"));
        var group:NanoGroup = new NanoGroup();
        group.add(getIcon()).add(getIcon());
        group.suWidth(200);
        group.suHeight(200);
        group.build();
        this.addChild(group);
        this.addEventListener(MouseEvent.CLICK, onMouseClick);
    }

    private function onMouseClick(event:MouseEvent):Void {
        trace("click thrue the space");
    }

    private function getIcon():Bitmap {
        var icon:Bitmap = new Bitmap(Assets.getBitmapData("assets/1.png", false));
        return icon;
    }

    public static function main() {
        Lib.current.addChild(new NanoTest());
    }
}
