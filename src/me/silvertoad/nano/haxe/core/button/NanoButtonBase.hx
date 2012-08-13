package me.silvertoad.nano.haxe.core.button;
import nme.events.Event;
import nme.events.MouseEvent;
import me.silvertoad.nano.haxe.utils.IDestroyable;
import me.silvertoad.nano.haxe.core.group.NanoGroup;
class NanoButtonBase extends NanoGroup, implements IDestroyable {

    private var _enabled:Bool;

    public function new() {
        super();
        _enabled = true;
        addListeners();
    }

    private function addListeners():Void {
        this.addEventListener(MouseEvent.MOUSE_OVER, mouseOverHandler);
        this.addEventListener(MouseEvent.MOUSE_OUT, mouseOutHandler);
        this.addEventListener(MouseEvent.MOUSE_DOWN, mouseDownHandler);
        this.addEventListener(MouseEvent.MOUSE_UP, mouseUpHandler);
        this.addEventListener(Event.MOUSE_LEAVE, mouseLeaveHandler);
    }

    private function removeListeners():Void {
        this.removeEventListener(MouseEvent.MOUSE_OVER, mouseOverHandler);
        this.removeEventListener(MouseEvent.MOUSE_OUT, mouseOutHandler);
        this.removeEventListener(MouseEvent.MOUSE_DOWN, mouseDownHandler);
        this.removeEventListener(MouseEvent.MOUSE_UP, mouseUpHandler);
        this.removeEventListener(Event.MOUSE_LEAVE, mouseLeaveHandler);
    }

    public function setEnabled(value:Bool):Void {
        _enabled = value;
    }

    public function getEnabled():Bool {
        return _enabled;
    }

    public function destroy():Void {
        removeListeners();
    }
}
