package me.silvertoad.nano.haxe.core.button.selectable;

import me.silvertoad.nano.haxe.utils.Preconditions;
import nme.events.EventDispatcher;

class NanoSelectableGroup extends EventDispatcher, implements INanoSelectableGroup {

    private var buttons:Array<INanoSelectableButton>;

    private var _selectedIndex:Int;

    public function new(?multiselect:Bool = false) {
        super();
        buttons = [];
        this.multiselect = multiselect;
        _selectedIndex = -1;
    }

    public var multiselect(default, _setMultiselect):Bool;

    public function _setMultiselect(value:Bool):Bool {
        if (!multiselect) {
            for (i in 0...buttons.length) {
                if (_selectedIndex != i) buttons[i].selected = false;
            }
        }

        return multiselect = value;
    }

    public var selectedButton(_getSelectedButton, _setSelectedButton):INanoSelectableButton;

    private function _getSelectedButton():INanoSelectableButton {
        return buttons[selectedIndex];
    }

    private function _setSelectedButton(button:INanoSelectableButton):INanoSelectableButton {
        Preconditions.checkState(Lambda.has(buttons, button), "Group not contains button: " + button + ".");
        this.selectedIndex = Lambda.indexOf(buttons, button);
        return button;
    }

    public var selectedIndex(_getSelectedIndex, _setSelectedIndex):Int;

    private function _getSelectedIndex():Int {
        return _selectedIndex;
    }

    private function _setSelectedIndex(value:Int):Int {
        Preconditions.checkState(value < buttons.length, "Index " + value + " out of range " + buttons.length);
        if (!multiselect) {
            if (_selectedIndex != -1 && _selectedIndex != value) this.selectedButton.selected = false;
        }
        _selectedIndex = value;
        this.selectedButton.selected = multiselect ? !this.selectedButton.selected : true;
        var selectEvent:NanoSelectedEvent = new NanoSelectedEvent(selectedButton);
        dispatchEvent(selectEvent);
        return _selectedIndex;
    }

    public function addButton(button:INanoSelectableButton):Void {
        if (!Lambda.has(buttons, button)) buttons.push(button);
    }

    public function removeButton(button:INanoSelectableButton):Void {
        Preconditions.checkState(Lambda.has(buttons, button), "Group not contains button: " + button + ".");
        if(Lambda.indexOf(buttons, button) == _selectedIndex && !multiselect) _selectedIndex = -1;
        buttons.remove(button);
    }
}