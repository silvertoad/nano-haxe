package ;

import nme.geom.Matrix;
import nme.display.GradientType;
import me.silvertoad.nano.haxe.quick.button.QuickTextTooltip;
import me.silvertoad.nano.haxe.core.button.NanoIconButton;
import me.silvertoad.nano.haxe.quick.button.ButtonStates;
import nme.text.TextFormatAlign;
import me.silvertoad.nano.haxe.quick.button.QuickTextButton;
import me.silvertoad.nano.haxe.quick.button.QuickDisplayObjectButton;
import nme.display.Graphics;
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

        //        this.addEventListener(MouseEvent.MOUSE_MOVE, onMouseMove);
        //        var textBtn:QuickTextButton = new QuickTextButton();
        //        textBtn.text = "Click me!\nPleace...";
        //        this.addChild(textBtn);

        //        var testIconButton:NanoIconButton = new NanoIconButton(new Bitmap(Assets.getBitmapData("assets/1.png", false)));
        //        this.addChild(testIconButton);

        var btn:QuickTextButton = new QuickTextButton();
        btn.text = "some text, here";
        this.addChild(btn);

        new QuickTextTooltip(btn, "im tooltip baby");

        //        var s:Sprite = new Sprite();
        //        var m:Matrix = new Matrix();
        //        m.createGradientBox(100, 40, (Math.PI / 180) * 90, 0, 0);
        //        s.graphics.beginGradientFill(GradientType.LINEAR, [0xFF00FF, 0x000000], [1, 1], [0, 255], m);
        //        s.graphics.drawRect(0, 0, 100, 40);
        //        s.graphics.endFill();
        //        this.addChild(s);
    }

    private function onMouseMove(event:MouseEvent):Void {
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