package me.silvertoad.nano.haxe.core.button;

import nme.events.Event;
import nme.events.MouseEvent;

class NanoBaseButton extends NanoButtonBase {

    public var click:msignal.Signal.Signal1<MouseEvent>;

    public function new() {
        super();
        click = new msignal.Signal.Signal1<MouseEvent>(MouseEvent);
    }

    override private function addListeners():Void {
        this.addEventListener(MouseEvent.MOUSE_OVER, mouseOverHandler);
        this.addEventListener(MouseEvent.MOUSE_OUT, mouseOutHandler);
        this.addEventListener(Event.MOUSE_LEAVE, mouseOutHandler);
        this.addEventListener(MouseEvent.MOUSE_DOWN, mouseDownHandler);
        this.addEventListener(MouseEvent.MOUSE_UP, mouseUpHandler);
        this.addEventListener(MouseEvent.CLICK, signalize);
    }

    override private function removeListeners():Void {
        this.removeEventListener(MouseEvent.MOUSE_OVER, mouseOverHandler);
        this.removeEventListener(MouseEvent.MOUSE_OUT, mouseOutHandler);
        this.removeEventListener(Event.MOUSE_LEAVE, mouseOutHandler);
        this.removeEventListener(MouseEvent.MOUSE_DOWN, mouseDownHandler);
        this.removeEventListener(MouseEvent.MOUSE_UP, mouseUpHandler);
        this.removeEventListener(MouseEvent.CLICK, signalize);
    }

    private function mouseOutHandler(event:Event):Void {
    }

    private function mouseOverHandler(event:MouseEvent):Void {
    }

    private function mouseUpHandler(event:MouseEvent):Void {
    }

    private function mouseDownHandler(event:MouseEvent):Void {
    }

    private function signalize(event:MouseEvent):Void {
        click.dispatch(event);
    }

    override private function _setEnabled(enabled:Bool):Bool {
        if (enabled != _enabled) {
            enabled ? enableButton() : disableButton();
        }
        return super._setEnabled(enabled);
    }

    private function enableButton():Void {

    }

    private function disableButton():Void {
        mouseEnabled = false;
    }
}
