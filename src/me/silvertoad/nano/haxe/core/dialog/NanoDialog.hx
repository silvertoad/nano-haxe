package me.silvertoad.nano.haxe.core.dialog;

import nme.events.MouseEvent;
import nme.events.Event;
import nme.display.Graphics;
import me.silvertoad.nano.haxe.core.event.NanoDialogEvent;
import nme.display.Sprite;
import nme.display.DisplayObject;

/**
 * Базовый диалог
 */
class NanoDialog extends NanoDialogCore, implements INanoDialog {

    inline public static var PALE_BROWN:Int = 0x95704E;
    inline public static var WHEAT:Int = 0xFFE8C0;

    private var _capture:DisplayObject;
    private var _useKeyboard:Bool;

    private var _background:Sprite;
    private var _closeBtn:DisplayObject;

    public function new() {
        super();
        addEventListener(Event.REMOVED_FROM_STAGE, removeFromStageHandler);
    }

    private function removeFromStageHandler(event:Event):Void {
        removeEventListener(Event.REMOVED_FROM_STAGE, removeFromStageHandler);
        if (_closeBtn != null) {
            _closeBtn.removeEventListener(MouseEvent.CLICK, closeBtnClickHandler);
        }
    }

    private function closeBtnClickHandler(event:MouseEvent):Void {
        close();
    }

    /**
     * @inheritDoc
     */
    public function close():Void {
        dispatchEvent(new NanoDialogEvent(NanoDialogEvent.NANO_DIALOG_CLOSE));
    }

    /**
     * @inheritDoc
     */
    public function renderBackground():Void {
        if (_background == null) {
            _background = new Sprite();
        }
        var graphics:Graphics = _background.graphics;
        graphics.clear();
        graphics.lineStyle(2, PALE_BROWN);
        graphics.beginFill(WHEAT);
        graphics.drawRect(0, 0, nWidth, nHeight);
        graphics.endFill();
        addChildAt(_background, 0);
    }

    /**
     * @inheritDoc
     */
//    public function renderCloseBtn():Void {
//        _closeBtn = _closeBtn || new CloseBtn();
//        _closeBtn.x = width - _closeBtn.width - 3;
//        _closeBtn.y = 5;
//        _closeBtn.addEventListener(MouseEvent.CLICK, closeBtnClickHandler);
//        addChildAt(_closeBtn, 1);
//    }

    public var capture(_getCapture, _setCapture):DisplayObject;

    private function _getCapture():DisplayObject {
        return _capture;
    }

    private function _setCapture(value:DisplayObject):DisplayObject {
        return _capture = value;
    }

    public var useKeyboard(_getUseKeyboard, _setUseKeyboard):Bool;

    private function _getUseKeyboard():Bool {
        return _useKeyboard;
    }

    private function _setUseKeyboard(value:Bool):Bool {
        return _useKeyboard = value;
    }

    private var _nX:Float;
    public var nX(null, _setX):Float;
    private function _setX(value:Float):Float {
        this.x = value;
        return _nX = value;
    }

    private var _nY:Float;
    public var nY(null, _setY):Float;
    private function _setY(value:Float):Float {
        this.y = value;
        return _nY = value;
    }


    override public function build():DisplayObject {
        var displayObject:DisplayObject = super.build();
        renderBackground();
        return displayObject;
    }
}