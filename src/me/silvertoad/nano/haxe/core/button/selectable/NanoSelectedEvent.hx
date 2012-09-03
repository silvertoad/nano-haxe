package me.silvertoad.nano.haxe.core.button.selectable;

import nme.events.Event;

class NanoSelectedEvent extends Event {

    inline public static var SELECTED_CHANGE:String = "button_selected";

    public var selectedButton:INanoSelectableButton;

    public function new(selectedButton:INanoSelectableButton) {
        this.selectedButton = selectedButton;
        super(SELECTED_CHANGE);
    }
}
