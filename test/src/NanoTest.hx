package ;
import me.silvertoad.nano.haxe.core.group.layout.NanoHorizontalLayout;
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
        super();
        icon = new Bitmap(Assets.getBitmapData("assets/1.png"));
        var group:NanoGroup = new NanoGroup(new NanoHorizontalLayout(0));
        group.add(getIcon()).add(getIcon());
        group.build();
        this.addChild(group);
        this.addEventListener(MouseEvent.CLICK, onMouseClick);
        trace("something");
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
