package ;
import nme.Assets;
import nme.display.Bitmap;
import me.silvertoad.nano.haxe.core.group.data.renderer.NanoItemRenderer;
class TestRenderer extends NanoItemRenderer<TestVO> {
    public function new() {
        super();
        nWidth = 100;
        nHeight = 100;
    }

    override public function setData(data:TestVO):Void {
        var icon:Bitmap = getIcon();
        icon.scaleX = icon.scaleY = data.scale;
        this.addChild(icon);
        build();
    }

    private function getIcon():Bitmap {
        var icon:Bitmap = new Bitmap(Assets.getBitmapData("assets/1.png", false));
        return icon;
    }
}
