package me.silvertoad.nano.haxe.quick.button;

import nme.filters.GlowFilter;
import nme.filters.DropShadowFilter;
import nme.filters.GlowFilter;
import me.silvertoad.nano.haxe.utils.LayoutUtils;
import nme.display.GradientType;
import nme.geom.Matrix;
import nme.events.Event;
import nme.events.MouseEvent;
import nme.display.DisplayObject;
import nme.display.DisplayObject;
import me.silvertoad.nano.haxe.core.button.NanoBaseButton;

class QuickDisplayObjectButton extends NanoBaseButton {

    private var _displayObject:DisplayObject;

    private var _currentState:String;

    private var _hash:Hash<Int>;

    public function new() {
        super();

        _hash = new Hash<Int>();
        _hash.set(ButtonStates.UP, 0xEDEFF7);
        _hash.set(ButtonStates.DOWN, 0x00FFFF);
        _hash.set(ButtonStates.OVER, 0xEDEFF7);
        _hash.set(ButtonStates.OUT, 0x00FF00);
        _currentState = ButtonStates.OUT;
        this.mouseChildren = false;
    }

    public function suDisplayObject(icon:DisplayObject):QuickDisplayObjectButton {
        _displayObject = icon;
        this.nWidth = LayoutUtils.getWidth(_displayObject) + getIndent() * 2;
        this.nHeight = LayoutUtils.getHeight(_displayObject) + getIndent() * 2;
        this.add(_displayObject);
        this.build();
        this.render(_currentState);
        return this;
    }

    override private function mouseOutHandler(event:Event):Void {
        this.render(ButtonStates.OUT);
    }

    override private function mouseOverHandler(event:MouseEvent):Void {
        this.render(ButtonStates.OVER);
    }

    override private function mouseUpHandler(event:MouseEvent):Void {
        this.render(ButtonStates.UP);
    }

    override private function mouseDownHandler(event:MouseEvent):Void {
        this.render(ButtonStates.DOWN);
    }

    private function getIndent():Float {
        return 3;
    }

    private function stroke():Float {
        return 2;
    }

    private function render(state:String):Void {
        advancedRender(0x000000, 0xFFFFFF, 0xD1D0B0);
    }

    private function advancedRender(stokeColour:Int, startColour:Int, endColour:Int):Void {
        this.graphics.clear();
        var innerHeight = nHeight - stroke() * 2;
        var innerWidth = nWidth - stroke() * 2;
        var matr:Matrix = new Matrix();
        matr.createGradientBox(innerWidth, innerHeight, Math.PI / 2, stroke(), stroke());
        this.graphics.beginGradientFill(GradientType.LINEAR, [startColour, endColour], [1, 1], [0, 255], matr);
        this.graphics.drawRect(stroke(), stroke(), innerWidth, innerHeight/*, round, round, round, round*/);
        this.graphics.endFill();
        this.filters = [new GlowFilter(0x0, 0.3, 3, 3), new DropShadowFilter(2)];
    }
}