package me.silvertoad.nano.haxe.core.button;

import nme.events.Event;
import nme.events.MouseEvent;
import nme.display.Shape;
import nme.display.Bitmap;

/**
 * Кнопка на основе иконки
 */
class NanoIconButton extends NanoBaseButton {

    private var _icon:Bitmap;
    private var _shadow:Shape;
    private var _shadowMask:Bitmap;

    public function new(icon:Bitmap) {
        super();

        _icon = icon;
        _shadow = new Shape();

        _shadowMask = new Bitmap(icon.bitmapData);
        _shadowMask.width = icon.width;
        _shadowMask.height = icon.height;
        _shadowMask.cacheAsBitmap = true;

        this.render(0);
        this.add(_shadowMask).add(icon).add(_shadow);
        this.build();
    }

    private function render(alpha:Float):Void {
        _shadow.graphics.clear();
        _shadow.graphics.beginFill(0x666666, alpha);
        _shadow.graphics.drawRect(0, 0, _icon.width, _icon.height);
        _shadow.graphics.endFill();
        _shadow.cacheAsBitmap = true;
        _shadow.mask = _shadowMask;
    }

    override private function mouseOutHandler(event:Event):Void {
        render(0);
    }

    override private function mouseOverHandler(event:MouseEvent):Void {
        render(0.15);
    }


    override private function mouseUpHandler(event:MouseEvent):Void {
        render(0.15);
    }

    override private function mouseDownHandler(event:MouseEvent):Void {
        render(0.5);
    }
}
