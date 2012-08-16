package me.silvertoad.nano.haxe.quick.button;

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
class QuickTextTooltip extends NanoGroup {

    private static var PADDING:Float = 2;
    private static var PADDING_LEFT:Float = 15;
    private static var PADDING_TOP:Float = 15;

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
        _textField = new TextField();
        _textField.mouseEnabled = false;
        _textField.x = _textField.y = PADDING;
        _textField.autoSize = TextFieldAutoSize.LEFT;
        this.addChild(_textField);

        _background = new Sprite();
        this.addChildAt(_background, 0);

        this.text = text;

        // Context
        if (target.stage != null) {
            this.setContext();
        } else {
            target.addEventListener(Event.ADDED_TO_STAGE, this.onStage);
        }

        // События
        target.addEventListener(MouseEvent.MOUSE_OVER, onMouseOver);
        target.addEventListener(MouseEvent.MOUSE_OUT, onMouseOut);
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
        _background.graphics.clear();
        _background.graphics.lineStyle(1, 0x989898);
        _background.graphics.beginFill(0xfffddd, 0.7);
        _background.graphics.drawRect(0, 0, _textField.width + PADDING * 2, _textField.height + PADDING * 2);
        _background.graphics.endFill();
        _background.alpha = 0.8;
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
        var deltaX:Float = _context.mouseX + this.width + PADDING_LEFT > _context.stageWidth
            ? (_context.mouseX - this.width)
            : (_context.mouseX) + PADDING_LEFT;
        var deltaY:Float = _context.mouseY + this.height + PADDING_TOP > _context.stageHeight
            ? (_context.mouseY - this.height)
            : (_context.mouseY) + PADDING_TOP;
        this.x = deltaX;
        this.y = deltaY;
    }
}
