package me.silvertoad.nano.haxe.core.button;
import nme.events.Event;
import nme.events.MouseEvent;
class NanoBaseButton extends NanoButtonBase {
    public function new() {
        super();
    }

    override private function addListeners():Void {
        this.addEventListener(MouseEvent.MOUSE_OVER, mouseOverHandler);
        this.addEventListener(MouseEvent.MOUSE_OUT, mouseOutHandler);
        this.addEventListener(Event.MOUSE_LEAVE, mouseOutHandler);
        this.addEventListener(MouseEvent.MOUSE_DOWN, mouseDownHandler);
        this.addEventListener(MouseEvent.MOUSE_UP, mouseUpHandler);
    }

    override private function removeListeners():Void {
        this.removeEventListener(MouseEvent.MOUSE_OVER, mouseOverHandler);
        this.removeEventListener(MouseEvent.MOUSE_OUT, mouseOutHandler);
        this.removeEventListener(Event.MOUSE_LEAVE, mouseOutHandler);
        this.removeEventListener(MouseEvent.MOUSE_DOWN, mouseDownHandler);
        this.removeEventListener(MouseEvent.MOUSE_UP, mouseUpHandler);
    }

    private function mouseOutHandler(event:Event):Void {
    }

    private function mouseOverHandler(event:MouseEvent):Void {
    }

    private function mouseUpHandler(event:MouseEvent):Void {
    }

    private function mouseDownHandler(event:MouseEvent):Void {
    }

    override public function setEnabled(enabled:Bool):Void {
        if (enabled != _enabled) {
            enabled ? enableButton() : disableButton();
            mouseEnabled = _enabled = enabled;
        }
    }

    override public function getEnabled():Bool {
        return _enabled;
    }

    private function enableButton():Void {

    }

    private function disableButton():Void {

    }
}
