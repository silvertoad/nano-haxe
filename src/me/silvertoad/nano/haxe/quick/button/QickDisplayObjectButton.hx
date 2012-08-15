package me.silvertoad.nano.haxe.quick.button;
import nme.display.GradientType;
import nme.geom.Matrix;
import nme.events.Event;
import nme.events.MouseEvent;
import nme.display.DisplayObject;
import nme.display.DisplayObject;
import me.silvertoad.nano.haxe.core.button.NanoBaseButton;

class QickDisplayObjectButton extends NanoBaseButton {

    private var _displayObject:DisplayObject;

    private var _hash:Hash<Int>;

    private var _currentState:String;

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

    public function suDisplayObject(icon:DisplayObject):QickDisplayObjectButton {
        _displayObject = icon;
        this.nWidth = _displayObject.width + getIndent() * 2;
        this.nHeight = _displayObject.height + getIndent() * 2;
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

    private function stoke():Float {
        return 1.5;
    }

    private function render(state:String):Void {
        advancedRender(0x000000, 0xFFFF00, 0xff00ff);
    }

    private function advancedRender(stokeColour:Int, startColour:Int, endColour:Int):Void {
        this.graphics.clear();
        this.graphics.beginFill(stokeColour);
        var round:Float = Math.min(nWidth, nHeight) * 0.1;
        this.graphics.drawRect(0, 0, nWidth, nHeight/*, round, round, round, round*/);
        this.graphics.endFill();

        var innerHeight = nHeight - stoke() * 2;
        var innerWidth = nWidth - stoke() * 2;
        round = Math.min(innerWidth, innerHeight) * 0.1;
        var matr:Matrix = new Matrix();
        matr.createGradientBox(innerWidth, innerHeight, 0, stoke(), stoke());
        matr.rotate(Math.PI / 180);
        this.graphics.beginGradientFill(GradientType.LINEAR, [startColour, endColour], [1, 1], [0, 255]);
        this.graphics.drawRect(stoke(), stoke(), innerWidth, innerHeight/*, round, round, round, round*/);
        this.graphics.endFill();
    }
}