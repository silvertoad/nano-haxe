package me.silvertoad.nano.haxe.core.button.selectable;

import nme.events.IEventDispatcher;

interface INanoSelectableGroup implements IEventDispatcher {
    /**
    * Добавить кнопку под контроль группы
    **/
    function addButton(button:INanoSelectableButton):Void;

    /**
    * Удалить кнопку из группы
    **/
    function removeButton(button:INanoSelectableButton):Void;

    /**
    * Установить выбранную кнопку
    **/
    var selectedButton(_getSelectedButton, _setSelectedButton):INanoSelectableButton;

    /**
    * Установить индекс выбранной кнопки
    **/
    var selectedIndex(_getSelectedIndex, _setSelectedIndex):Int;

    /**
    * Возможность выделения нескольких элементов
    **/
    var multiselect(default, _setMultiselect):Bool;
}