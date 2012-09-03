package me.silvertoad.nano.haxe.quick.button;

import nme.errors.ArgumentError;
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

    private var _currentState:String;

    public function new() {
        super();
        _currentState = ButtonStates.OUT;
        this.mouseChildren = false;
    }

    public var displayObject(default, _setDisplayObject):DisplayObject;

    private function _setDisplayObject(displayObject:DisplayObject):DisplayObject {
        if(nWidth == 0) this.nWidth = LayoutUtils.getWidth(displayObject) + getIndent() * 4;
        if(nHeight == 0) this.nHeight = LayoutUtils.getHeight(displayObject) + getIndent() * 2;
        this.add(displayObject);
        this.build();
        this.render(_currentState);
        return this.displayObject = displayObject;
    }

    public function suDisplayObject(icon:DisplayObject):QuickDisplayObjectButton {
        displayObject = icon;
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
        _currentState = state;
        switch(_currentState){
            case ButtonStates.OUT:
                advancedRender(0xF5F4E4, 0xD1D0B0);
            case ButtonStates.OVER:
                advancedRender(0xFFFFFF, 0xD1D0B0);
            case ButtonStates.DOWN:
                advancedRender(0xF5F4E4, 0xD1D0B0);
            case ButtonStates.UP:
                advancedRender(0xFFFFFF, 0xD1D0B0);
            default:
                throw new ArgumentError("Undefined state: " + state);
        }
    }

    private function advancedRender(startColour:Int, endColour:Int, glowColour:Int = 0x0):Void {
        this.graphics.clear();
        var innerHeight = nHeight - stroke() * 2;
        var innerWidth = nWidth - stroke() * 2;
        var matrix:Matrix = new Matrix();
        matrix.createGradientBox(innerWidth, innerHeight, Math.PI / 2, stroke(), stroke());
        this.graphics.beginGradientFill(GradientType.LINEAR, [startColour, endColour], [1, 1], [0, 255], matrix);
        this.graphics.drawRect(stroke(), stroke(), innerWidth, innerHeight);
        this.graphics.endFill();
        this.filters = [new GlowFilter(glowColour, 0.3, 3, 3), new DropShadowFilter(2)];
    }
}