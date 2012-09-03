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

    public var enabled(_getEnabled, _setEnabled):Bool;

    private function _getEnabled():Bool {
        return _enabled;
    }

    private function _setEnabled(value:Bool):Bool {
        return _enabled = value;
    }

    public function destroy():Void {
        removeListeners();
    }
}