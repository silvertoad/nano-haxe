package ;

import me.silvertoad.nano.haxe.core.group.layout.INanoLayout;
import me.silvertoad.nano.haxe.core.group.layout.NanoTileLayout;
import me.silvertoad.nano.haxe.core.group.NanoGroup;
import nme.Assets;
import me.silvertoad.nano.haxe.core.group.data.NanoDataGroup;
import nme.Lib;
import nme.events.MouseEvent;
import nme.display.Bitmap;
import nme.display.Sprite;

class NanoTest extends Sprite {

    private var icon:Bitmap;

    public function new() {
        super();

        var layout:INanoLayout = new NanoTileLayout().suNumColumn(2);
        var group:NanoDataGroup<TestVO> = new NanoDataGroup<TestVO>(layout);
        group.itemRenderer = TestRenderer;
        group.dataProvider = [new TestVO(), new TestVO(), new TestVO(), new TestVO()];
        group.build();
        addChild(group);
    }

    private function getIcon():Bitmap {
        var icon:Bitmap = new Bitmap(Assets.getBitmapData("assets/1.png", false));
        return icon;
    }

    public static function main() {
        #if (flash9 || flash10)
        haxe.Log.trace = function(v,?pos) { untyped __global__["trace"](pos.className+"#"+pos.methodName+"("+pos.lineNumber+"):",v); }
        #elseif flash
        haxe.Log.trace = function(v,?pos) { flash.Lib.trace(pos.className+"#"+pos.methodName+"("+pos.lineNumber+"): "+v); }
        #end
        Lib.current.addChild(new NanoTest());
    }
}