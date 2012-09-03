package me.silvertoad.nano.haxe.core.dialog;

import nme.display.DisplayObject;
import nme.events.IEventDispatcher;

interface INanoDialog implements IEventDispatcher {

    /**
     * Ссылка на подложку диалога
     */
    var capture(_getCapture, _setCapture):DisplayObject;

    /**
     * Использовать ли клавиатуру для выхода из диалога
     */
    var useKeyboard(_getUseKeyboard, _setUseKeyboard):Bool;

    /**
     * Ширина диалога
     */
    var nWidth(_getWidth, _setWidth):Float;

    /**
     * Высота диалога
     */
    var nHeight(_getHeight, _setHeight):Float;

    var nX(null, _setX):Float;

    var nY(null, _setY):Float;

    /**
     * Закрыть диалог
     */
    function close():Void;

    /**
     * Отрисовать фон диалога
     */
    function renderBackground():Void;

    /**
     * Отрисовать кнопку закрыть
     */
    //function renderCloseBtn():Void;
}
