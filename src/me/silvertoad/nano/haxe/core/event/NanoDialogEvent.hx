package me.silvertoad.nano.haxe.core.event;

import me.silvertoad.nano.haxe.core.dialog.INanoDialog;
import nme.events.Event;

class NanoDialogEvent extends Event {

    public static var NANO_DIALOG_CLOSE:String = "NANO_DIALOG_CLOSE";

    public function new(type:String) {
        super(type);
    }

    public var dialog(_getDialog, null):INanoDialog;

    private function _getDialog():INanoDialog {
        return cast target;
    }
}