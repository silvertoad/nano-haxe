package me.silvertoad.nano.haxe.quick.button;

import nme.display.GradientType;
import nme.filters.GlowFilter;
import nme.filters.DropShadowFilter;
import nme.geom.Matrix;
import me.silvertoad.nano.haxe.utils.IDestroyable;
import nme.text.TextFieldAutoSize;
import nme.text.TextField;
import nme.events.MouseEvent;
import nme.events.Event;
import nme.display.Sprite;
import nme.display.Stage;
import nme.display.DisplayObject;
import me.silvertoad.nano.haxe.core.group.NanoGroup;

/**
 * Base tooltip element
 */
class QuickTextTooltip extends NanoGroup, implements IDestroyable {

    private static var INNER_PADDING:Float = 2;

    private static var MOUSE_PADDING_LEFT:Float = 15;
    private static var MOUSE_PADDING_TOP:Float = 15;

    private var _target:DisplayObject;
    private var _context:Stage;

    private var _textField:TextField;
    private var _background:Sprite;

    public function new(target:DisplayObject, text:String) {

        super();

        _target = target;

        this.mouseChildren = false;
        this.mouseEnabled = false;

        // Layout
        _background = new Sprite();
        add(_background);

        _textField = new TextField();
        _textField.mouseEnabled = false;
        _textField.autoSize = TextFieldAutoSize.LEFT;
        add(_textField);

        this.text = text;

        // Context
        if (_target.stage != null) {
            this.setContext();
        } else {
            _target.addEventListener(Event.ADDED_TO_STAGE, this.onStage);
        }

        // События
        _target.addEventListener(MouseEvent.MOUSE_OVER, onMouseOver);
        _target.addEventListener(MouseEvent.MOUSE_OUT, onMouseOut);
    }

    public function destroy():Void {
        _target.removeEventListener(MouseEvent.MOUSE_OVER, onMouseOver);
        _target.removeEventListener(MouseEvent.MOUSE_OUT, onMouseOut);
        _target.removeEventListener(MouseEvent.MOUSE_MOVE, onMouseMove);
    }

    private function onStage(e:Event):Void {
        _target.removeEventListener(Event.ADDED_TO_STAGE, this.onStage);
        this.setContext();
    }

    private function setContext():Void {
        _context = _target.stage;
    }

    /**
     * Перерисовать фон
     */

    private function rebuildBackground():Void {
        var innerWidth = _textField.width + INNER_PADDING * 2;
        var innerHeight = _textField.height + INNER_PADDING * 2;

        var matrix:Matrix = new Matrix();
        matrix.createGradientBox(innerWidth, innerHeight, Math.PI / 2, 1, 1);

        _background.graphics.clear();
        _background.graphics.lineStyle(1, 0x989898);
        _background.graphics.beginGradientFill(GradientType.LINEAR, [0xFFFFFF, 0xD1D0B0], [1, 1], [0, 255], matrix);
        _background.graphics.drawRect(0, 0, innerWidth, innerHeight);
        _background.graphics.endFill();
        _background.alpha = 0.8;

        _background.filters = [new GlowFilter(0x0, 0.3, 3, 3)];
    }

    /**
     * Аксессоры на текст
     */
    public var text(_getText, _setText):String;

    private function _getText():String {
        return _textField.text;
    }

    private function _setText(value:String):String {
        _textField.text = value;
        this.rebuildBackground();
        this.build();
        return value;
    }

    /**
     * События
     */

    private function onMouseOver(e:MouseEvent):Void {
        show();
    }

    private function onMouseOut(e:MouseEvent):Void {
        hide();
    }

    public function show():Void {
        _target.addEventListener(MouseEvent.MOUSE_MOVE, onMouseMove);
        _context.addChild(this);
        onMouseMove();
    }

    public function hide():Void {
        _target.removeEventListener(MouseEvent.MOUSE_MOVE, onMouseMove);
        _context.removeChild(this);
    }

    private function onMouseMove(e:MouseEvent = null):Void {
        var deltaX:Float = _context.mouseX + this.width + MOUSE_PADDING_LEFT > _context.stageWidth
        ? (_context.mouseX - this.width)
        : (_context.mouseX) + MOUSE_PADDING_LEFT;
        var deltaY:Float = _context.mouseY + this.height + MOUSE_PADDING_TOP > _context.stageHeight
        ? (_context.mouseY - this.height)
        : (_context.mouseY) + MOUSE_PADDING_TOP;
        this.x = deltaX;
        this.y = deltaY;
    }
}
