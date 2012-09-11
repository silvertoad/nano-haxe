package me.silvertoad.nano.haxe.core.button.selectable;

import me.silvertoad.nano.haxe.utils.Preconditions;
import nme.events.EventDispatcher;

class NanoSelectableGroup extends EventDispatcher, implements INanoSelectableGroup {

    private var _buttons:Array<INanoSelectableButton>;

    private var _selectedIndex:Int;

    public function new(?multiselect:Bool = false) {
        super();
        _buttons = [];
        this.multiselect = multiselect;
        _selectedIndex = -1;
    }

    public var multiselect(default, _setMultiselect):Bool;

    public function _setMultiselect(value:Bool):Bool {
        if (!multiselect) {
            for (i in 0..._buttons.length) {
                if (_selectedIndex != i) _buttons[i].selected = false;
            }
        }

        return multiselect = value;
    }

    public var numButtons(_getNumButtons, null):Int;

    private function _getNumButtons():Int {
        return _buttons.length;
    }

    public var selectedButton(_getSelectedButton, _setSelectedButton):INanoSelectableButton;

    private function _getSelectedButton():INanoSelectableButton {
        return _buttons[selectedIndex];
    }

    private function _setSelectedButton(button:INanoSelectableButton):INanoSelectableButton {
        Preconditions.checkState(Lambda.has(_buttons, button), "Group not contains button: " + button + ".");
        this.selectedIndex = Lambda.indexOf(_buttons, button);
        return button;
    }

    public var selectedIndex(_getSelectedIndex, _setSelectedIndex):Int;

    private function _getSelectedIndex():Int {
        return _selectedIndex;
    }

    private function _setSelectedIndex(value:Int):Int {
        Preconditions.checkState(value < _buttons.length, "Index " + value + " out of range " + _buttons.length);
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
        if (!Lambda.has(_buttons, button)) _buttons.push(button);
    }

    public function removeButton(button:INanoSelectableButton):Void {
        Preconditions.checkState(Lambda.has(_buttons, button), "Group not contains button: " + button + ".");
        if (Lambda.indexOf(_buttons, button) == _selectedIndex && !multiselect) _selectedIndex = -1;
        _buttons.remove(button);
        if (_buttons.length == 0) _selectedIndex = -1;
    }

    public function removeButtonAt(index:Int):Void {
        Preconditions.checkState(index < _buttons.length, "Index " + index + " out of range " + _buttons.length);
        removeButton(_buttons[index]);
    }
}