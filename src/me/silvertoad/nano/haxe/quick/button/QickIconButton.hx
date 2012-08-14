package me.silvertoad.nano.haxe.quick.button;
import nme.events.Event;
import nme.events.MouseEvent;
import nme.display.DisplayObject;
import nme.display.DisplayObject;
import me.silvertoad.nano.haxe.core.button.NanoBaseButton;

class QickIconButton extends NanoBaseButton {

    private var _icon:DisplayObject;

    public function new() {
        super();
        this.mouseChildren = false;
    }

    public function suIcon(icon:DisplayObject):QickIconButton {
        _icon = icon;
        this.add(_icon);
        this.render(0xFFFF00);
        return this;
    }

    override private function mouseOutHandler(event:Event):Void {
        this.render(0xFFFF00);
    }

    override private function mouseOverHandler(event:MouseEvent):Void {
        this.render(0xEDEFF7);
    }

    override private function mouseUpHandler(event:MouseEvent):Void {
        this.render(0xEDEFF7);
    }

    override private function mouseDownHandler(event:MouseEvent):Void {
        this.render(0x00FFFF);
    }

    private function getIndent():Float {
        return 3;
    }

    private function render(colour:Int):Void {
        this.nWidth = _icon.width + getIndent() * 2;
        this.nHeight = _icon.height + getIndent() * 2;
        this.build();
        this.graphics.clear();
        this.graphics.beginFill(colour);
        var round:Float = Math.min(nWidth, nHeight) * 0.1;
        this.graphics.drawRoundRectComplex(0, 0, nWidth, nHeight, round, round, round, round);
        this.graphics.endFill();
    }
}
