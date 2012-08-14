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
    }

    private function removeListeners():Void {
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
